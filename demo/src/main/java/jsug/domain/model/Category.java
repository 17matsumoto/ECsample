package jsug.domain.model;

import java.io.Serializable;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Category implements Serializable {
    private int categoryId;
    private String categoryName;
}