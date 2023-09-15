Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580607A28BC
	for <lists+linux-input@lfdr.de>; Fri, 15 Sep 2023 22:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236780AbjIOUyn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Sep 2023 16:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbjIOUyN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Sep 2023 16:54:13 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101223A81
        for <linux-input@vger.kernel.org>; Fri, 15 Sep 2023 13:54:00 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-56a8794b5adso2093523a12.2
        for <linux-input@vger.kernel.org>; Fri, 15 Sep 2023 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694811239; x=1695416039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23ApIL1YdiziP2ghr5U7yZnzE5Ul7+YcORTNoluzxDo=;
        b=ZZE97FanjWoWVhnrfXcGRqunmMtwq+GyjdO5WaEQsgde829YQV6Vib7nXOy2uD7OAJ
         mvo04XTJapwHNAaChTTOQQjYe8i9VgWVUeePQIwoETLzV/zaWlLAjfZO2hUL8gG0ByXR
         Fq/poSjgbkTRGu6/ZYPisW0ksh5xGqo0LhskQ0m7mkod9z73UMfis3HEJ4LFBnrYQStW
         4c/gRtU7dd4G+GhewNUiWup02eNy6a1xBdxgBPwJOxscK7Ceh8/3hF8k+msXlDtq9NJB
         l3sH1XEDmcF7bKL3Wq9pN5giuDXafHxxnZRn8NhZ1xg5dGhLqZm6ddqxsfUNKAZdsQBX
         nltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694811239; x=1695416039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23ApIL1YdiziP2ghr5U7yZnzE5Ul7+YcORTNoluzxDo=;
        b=pD53tZaGzfxjFlr9KmIxkBN5lQpZ0o76l+L8Nb8jI/n5RMHGDsFT5Qq+hsFoXvw0eW
         u+6CVBrfIyBFH+0YybCUBqj/8lDYP7dc0UTeev0orkj88jQ80Y0gry9hI+YDSk773dfN
         D5xGrNdRqDKbUEdX8xAvFQjN0ok+PHn9HHtYkl9pVafkDHbGbTHb76xH3H33m1SeRdK4
         N9fFONE4FFa7MsBN3/gZhrI3VYiE8F7XOe2ki0tPzomG7Rk2yIJUvsx/9yGvZnhBZ419
         4OxK4JvQzTOhM7zWIJy6kF6y2wtP9fDUzopMeiXBAD25KHanz6JXWM8ARj0tUiwVCNx2
         MEMA==
X-Gm-Message-State: AOJu0YxI9w4jd5efqbUjhOWQ1aeGyKHjccNHDHTK7fnyKk8LpQaNknB2
        BtIJDk2n62KnCxkbML7km7k=
X-Google-Smtp-Source: AGHT+IEHAMw9WSF9MTl97RfrfJ7PhpG+ThK5WOpIMHeOTiiml8mhwfMn9ZwRqjJnYd1EIFwJlXhyaA==
X-Received: by 2002:a17:90a:f48b:b0:268:1b62:2f6c with SMTP id bx11-20020a17090af48b00b002681b622f6cmr2647737pjb.2.1694811239163;
        Fri, 15 Sep 2023 13:53:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:efa0:49c:ba93:3271])
        by smtp.gmail.com with ESMTPSA id p6-20020a17090b010600b002682523653asm3387708pjz.49.2023.09.15.13.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:53:58 -0700 (PDT)
Date:   Fri, 15 Sep 2023 13:53:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     HP Dev <hphyperxdev@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Chris Toledanes <chris.toledanes@hp.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: Re: [PATCH RESEND] Input: xpad - Add HyperX Clutch Gladiate Support
Message-ID: <ZQTEZEdd7xwHz9CN@google.com>
References: <20230906231514.4291-1-hphyperxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906231514.4291-1-hphyperxdev@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Max,

On Wed, Sep 06, 2023 at 04:15:15PM -0700, HP Dev wrote:
> Add HyperX controller support to xpad_device and xpad_table.
> 
> Suggested-by: Chris Toledanes <chris.toledanes@hp.com>
> Reviewed-by: Carl Ng <carl.ng@hp.com>
> Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>


Sorry for the delay. It is weird to have "HP Dev" as an author of the
patch, if you not mind I will change this to "Max Nguyen
<maxwell.nguyen@hp.com>" before applying, please let me know.

Thanks.

-- 
Dmitry
