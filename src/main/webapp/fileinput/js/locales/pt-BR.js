/*!
 * FileInput Brazillian Portuguese Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-fileinput
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";

    $.fn.fileinputLocales['pt-BR'] = {
        fileSingle: 'arquivo',
        filePlural: 'arquivos',
        browseLabel: 'Procurar&hellip;',
        removeLabel: 'Remover',
        removeTitle: 'Remover arquivos selecionados',
        cancelLabel: 'Cancelar',
        cancelTitle: 'Interromper envio em andamento',
        uploadLabel: 'Enviar',
        uploadTitle: 'Enviar arquivos selecionados',
        msgNo: 'N�O',
        msgNoFilesSelected: 'Nenhum arquivo selecionado',
        msgCancelled: 'Cancelado',
        msgPlaceholder: 'Selecionar {files}...',
        msgZoomModalHeading: 'Pr�-visualiza��o detalhada',
        msgFileRequired: 'Voc� deve selecionar um arquivo para enviar.',
        msgSizeTooSmall: 'O arquivo "{name}" (<b>{size} KB</b>) � muito pequeno e deve ser maior que <b>{minSize} KB</b>.',
        msgSizeTooLarge: 'O arquivo "{name}" (<b>{size} KB</b>) excede o tamanho m�ximo permitido de <b>{maxSize} KB</b>.',
        msgFilesTooLess: 'Voc� deve selecionar pelo menos <b>{n}</b> {files} para enviar.',
        msgFilesTooMany: 'O n�mero de arquivos selecionados para o envio <b>({n})</b> excede o limite m�ximo permitido de <b>{m}</b>.',
        msgFileNotFound: 'O arquivo "{name}" n�o foi encontrado!',
        msgFileSecured: 'Retri��es de seguran�a impedem a leitura do arquivo "{name}".',
        msgFileNotReadable: 'O arquivo "{name}" n�o pode ser lido.',
        msgFilePreviewAborted: 'A pr�-visualiza��o do arquivo "{name}" foi interrompida.',
        msgFilePreviewError: 'Ocorreu um erro ao ler o arquivo "{name}".',
        msgInvalidFileName: 'Caracteres inv�lidos ou n�o suportados no arquivo "{name}".',
        msgInvalidFileType: 'Tipo inv�lido para o arquivo "{name}". Apenas arquivos "{types}" s�o permitidos.',
        msgInvalidFileExtension: 'Extens�o inv�lida para o arquivo "{name}". Apenas arquivos "{extensions}" s�o permitidos.',
        msgFileTypes: {
            'image': 'imagem',
            'html': 'HTML',
            'text': 'texto',
            'video': 'v�deo',
            'audio': 'audio',
            'flash': 'flash',
            'pdf': 'PDF',
            'object': 'objeto'
        },
        msgUploadAborted: 'O envio do arquivo foi abortado',
        msgUploadThreshold: 'Processando...',
        msgUploadBegin: 'Inicializando...',
        msgUploadEnd: 'Conclu�do',
        msgUploadEmpty: 'Nenhuma informa��o v�lida para upload.',
        msgUploadError: 'Erro de Upload',
        msgValidationError: 'Erro de valida��o',
        msgLoading: 'Enviando arquivo {index} de {files}&hellip;',
        msgProgress: 'Enviando arquivo {index} de {files} - {name} - {percent}% completo.',
        msgSelected: '{n} {files} selecionado(s)',
        msgFoldersNotAllowed: 'Arraste e solte apenas arquivos! {n} pasta(s) ignoradas.',
        msgImageWidthSmall: 'Largura do arquivo de imagem "{name}" deve ser pelo menos {size} px.',
        msgImageHeightSmall: 'Altura do arquivo de imagem "{name}" deve ser pelo menos {size} px.',
        msgImageWidthLarge: 'Largura do arquivo de imagem "{name}" n�o pode exceder {size} px.',
        msgImageHeightLarge: 'Altura do arquivo de imagem "{name}" n�o pode exceder {size} px.',
        msgImageResizeError: 'N�o foi poss�vel obter as dimens�ees da imagem para redimensionar.',
        msgImageResizeException: 'Erro ao redimensionar a imagem.<pre>{errors}</pre>',
        msgAjaxError: 'Algo deu errado com a opera��o {operation}. Por favor tente novamente mais tarde!',
        msgAjaxProgressError: '{operation} falhou',
        ajaxOperations: {
            deleteThumb: 'Exclus�o de arquivo',
            uploadThumb: 'Upload de arquivos',
            uploadBatch: 'Carregamento de arquivos em lote',
            uploadExtra: 'Carregamento de dados do formul�rio'
        },
        dropZoneTitle: 'Arraste e solte os arquivos aqui&hellip;',
        dropZoneClickTitle: '<br>(ou clique para selecionar o(s) arquivo(s))',
        fileActionSettings: {
            removeTitle: 'Remover arquivo',
            uploadTitle: 'Enviar arquivo',
            uploadRetryTitle: 'Retry upload',
            downloadTitle: 'Download file',
            zoomTitle: 'Ver detalhes',
            dragTitle: 'Mover / Reordenar',
            indicatorNewTitle: 'Ainda n�o enviado',
            indicatorSuccessTitle: 'Enviado',
            indicatorErrorTitle: 'Erro',
            indicatorLoadingTitle: 'Enviando...'
        },
        previewZoomButtonTitles: {
            prev: 'Visualizar arquivo anterior',
            next: 'Visualizar pr�ximo arquivo',
            toggleheader: 'Mostrar cabe�alho',
            fullscreen: 'Ativar tela cheia',
            borderless: 'Ativar modo sem borda',
            close: 'Fechar pr�-visualiza��o detalhada'
        }
    };
})(window.jQuery);
