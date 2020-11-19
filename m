Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0934D2B8C0B
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgKSHKm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgKSHKm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:10:42 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFEEC0613CF;
        Wed, 18 Nov 2020 23:10:42 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 10so3583142pfp.5;
        Wed, 18 Nov 2020 23:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5oCeJjPSJ4vYW6BJo2b4jzdTzQH4gyKLvyQjtKF8RBo=;
        b=q980idP904OtJGw7+dNjPRiBR4qPRwu5XneSHHyp7eL6G1AF5Uprct0R8Wh82mgKOL
         7+UlHH4xTCr3Dg3/AA01cCAjGu9xzu+7sGOtwL7dHvdAICX1YdUz0iIkHj3sXpkHnFl0
         rkau9p8Z3ZU33yujFDKFkDz86/dDP0D525P4GpjQR4IAxPi9rVCYmiv43t+MZRCA6J3G
         Tj4Jd7kDEldJSzFNLiRDw5kHvg079X99YdLmN2cZ2dQb82mpYTbWvRwsaAlhn5uAo8D8
         7jHzZd9IUN8E/TZH+d8/7ZHLsyHYpFJe4FZYVVdQzuBHR9NME4U+Lvxkf3s8KjF2PO28
         7Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5oCeJjPSJ4vYW6BJo2b4jzdTzQH4gyKLvyQjtKF8RBo=;
        b=tgWx8iRft70nnbYuWN4q54oT9X4/2p+zNdGrWZab1ZyscAa4O2r8imHA7X4MoEjjAW
         PezOLyoOSvrmxmGrtcHnJLM9UbeEGB/Qyia4uJ6bPe46Fr/5ncfulIt0FcgIqL7HFKQj
         hamECFrRysJu+2SHq/9rYiHf/wPvsFvlm8H5ktabUQRDF6+ijKHUuca4+GIKVBxHPdO1
         lId5J3Kbqwv6UqWNrSnlNOsTjI0VUzLXXLdChpzmnuu0sLT2J9mh6/l56N6fiGIUC6bY
         lu9cO1DDiRWyyN4VOJM302F+6womqg0YlpkSabFprsJZn0tgm1C3ZQCJrAL+72oictlr
         gq9w==
X-Gm-Message-State: AOAM533zXOpYFDVl+qG74hOp1RFOTYb03GCzsSjF1FnxxaFTTlo1hOdc
        xZ9zf8UrNyAOd5+50RnNFc0=
X-Google-Smtp-Source: ABdhPJwzp5JXMJL5qHp4MQ2L/oP96MqVziG0Cw3HXB36tX8o17psLUjBa6TFgCwIpe9okR9uNnONLw==
X-Received: by 2002:a17:90b:e86:: with SMTP id fv6mr3124141pjb.196.1605769841943;
        Wed, 18 Nov 2020 23:10:41 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id gk17sm5499931pjb.2.2020.11.18.23.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:10:41 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:10:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: adp5589: use devm_add_action_or_reset()
 for register clear
Message-ID: <20201119071038.GG2034289@dtor-ws>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
 <20201112074308.71351-6-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112074308.71351-6-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 09:43:08AM +0200, Alexandru Ardelean wrote:
> The driver clears the general configuration register during the remove()
> hook. This should also be done in case the driver exits on error.
> 
> This change move the clear of that register to the
> devm_add_action_or_reset() hook.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied, thank you.

-- 
Dmitry
