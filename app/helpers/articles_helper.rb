module ArticlesHelper
    def form_title
        @article.new_record? ? "Agregar Post" : "Modificar Post"
    end
end
