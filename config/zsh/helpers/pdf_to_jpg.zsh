pdf_to_jpg() {
    if [[ -z "$1" ]]; then
        echo "Erreur: Veuillez spécifier un fichier PDF"
        echo "Usage: pdf_to_jpg fichier.pdf"
        return 1
    fi

    local PDF="$1"
    local DIR=$(basename "$PDF" .pdf)

    # Vérifier si le fichier existe
    if [[ ! -f "$PDF" ]]; then
        echo "Erreur: Le fichier '$PDF' n'existe pas"
        return 1
    fi

    echo "Traitement de $PDF"

    # Créer un répertoire temporaire
    local TEMP_DIR=$(mktemp -d)

    # Créer le répertoire de sortie s'il n'existe pas
    mkdir -p "$DIR"

    echo ' Conversion des pages PDF en images JPG...'

    # Extraire et convertir les pages directement sans fichiers PDF temporaires
    pdftk "$PDF" burst output "$TEMP_DIR"/%04d.pdf

    # Convertir chaque page PDF en JPG et les placer dans le répertoire final
    for page in "$TEMP_DIR"/*.pdf; do
        if [[ "$page" != "$TEMP_DIR/doc_data.txt" ]]; then
            local page_num=$(basename "$page" .pdf)
            convert -colorspace RGB -interlace none -density 300x300 -quality 100 "$page" "$DIR/$page_num.jpg"
        fi
    done

    # Supprimer le répertoire temporaire et tous ses fichiers
    rm -rf "$TEMP_DIR"

    echo 'Conversion terminée'
}
