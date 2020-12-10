Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F70B2D5011
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 02:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgLJBIw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 20:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgLJBIv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 20:08:51 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A94C0613CF;
        Wed,  9 Dec 2020 17:08:11 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id v29so2586827pgk.12;
        Wed, 09 Dec 2020 17:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ScTXQXoCHt8Q2ANMh2aNx7O1cu5jo7H5Ik1s8yBzefE=;
        b=p+HK4b7+lVUo32xiSZnW0Y4wOtu5qTrmXlaw96EmrAejZ49VAydnDgF72Y7p9C04cH
         elpNuAxs+fPdjpXGQwEVE/jDqR4dhVlmdLR6aP/UfLoMrDaYNtERDiGBp/BGMX5HK+z8
         nAnMio2sEBfgGmjrPw+r4R7VZzmSdX3k1YRypaX6yr3FM1krIoW6nkXMlI63pfwnq49O
         i7RrLIZa8GzS8RUKKxNp3aBqeW9z7wN4Zz+0VZNmiW4qyOKssUuzcP2zC+st6ihV/g34
         pCTYX19XgiFE2kWuSMcrhbGJfpLf+yUq6/D1PlbmLC/FUJQviXZhOi2UxkN+mepdqfZr
         gBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ScTXQXoCHt8Q2ANMh2aNx7O1cu5jo7H5Ik1s8yBzefE=;
        b=jl1YtiYK9kjT8gmgkN31qT7UtsdbbK1RVfZyNK7p/HFNWog5umRYGt0X+zFlxIkc2/
         qKpTTJoIoOMD9zZYXZpwLGsKmC8f2LWHukmNSVH6TgbilpdUfLyKzGi7jPqweqIQt6wW
         Rb9VvACrQt68X0pO0unyueS0JWhGLCX8hQ+8ZUfmNOLTfXUxuwjRaBeutYmI3JitSsXz
         Snjq02d4Eyq6H3/U6pRU+yLDeybLw4IhGADUyCvSzLyaPMgIA9pOmYCdIsOMwkxPfSFb
         ISOidRXu5lEFoW4Ko8+z+DD83FsY1yQi5ZE2ZbuOa1+offbAjuPtnzViNXmvqp3vpRji
         1N7A==
X-Gm-Message-State: AOAM533/+mBQzHXWJsGmdHk0IdWeUeb5NhqMrowHp81KDY4QAhsJgMB5
        XctZptblbIH3EiSvneH0f0w=
X-Google-Smtp-Source: ABdhPJz9xp2q6470RJ1ErlaT+HUPLkT2Gnf7i4KJmqojsdHzaNNZbE6Yr70eU3JLtCc7d/OKVK9MSg==
X-Received: by 2002:a65:6a4e:: with SMTP id o14mr4366032pgu.65.1607562491232;
        Wed, 09 Dec 2020 17:08:11 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f126sm4181079pfg.153.2020.12.09.17.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 17:08:10 -0800 (PST)
Date:   Wed, 9 Dec 2020 17:08:08 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: fix spelling mistake "theses" -> "these" in
 Kconfig
Message-ID: <X9F0+B9EwXtJBBS6@google.com>
References: <20201204193635.1152241-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204193635.1152241-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 04, 2020 at 07:36:35PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry
