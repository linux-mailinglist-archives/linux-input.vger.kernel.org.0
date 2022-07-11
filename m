Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4FC7570D67
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 00:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiGKWcz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jul 2022 18:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiGKWci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jul 2022 18:32:38 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FC5624A7;
        Mon, 11 Jul 2022 15:32:37 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso9677442pjc.1;
        Mon, 11 Jul 2022 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jBDqPK/Swafc8Yh0mm5XdlTCPiVZKHEp3Q4cazgUGE4=;
        b=olL6fgn9sYuqh9FeLg2p0gpDJkA3xKSGto54wgoPy0fRC+8mMPyA9ZRhl4MPRmT35I
         6zLZhozheLJ/hUZTUfrSrPpK6nkEhOQY92G0WMc1jDG2lglf3HpkQjyV1s0XSFTi5UJO
         QOeFNTLJpv0Avk3HxayNo6r7E/WOpHuJ+y+g6RMB2JbYbbQGk929EUaFfE4ryqz0e2jt
         hXI92nPq5VvCw8+vQCJNb9k51965NirD7W4Vp0vJP9Z9i91PGezVlSvJE8AXZvgaHWQg
         WlVggACucT/2QCyzEKY50PX9GJ6R2NXIP0IFzB+RwdCJ8e1A1RiT+idTPghYtVdpwT3A
         iYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jBDqPK/Swafc8Yh0mm5XdlTCPiVZKHEp3Q4cazgUGE4=;
        b=nNEQGLj43/fMe7ofWEUVMTQSXCwf7letQ2ZKFzz3RLmGnJmzjqYyC/Q2WpJGatkw4d
         zvdEoHvGkogSrcIQvhHtfcjL55iu+uBpknpJ6e6OVpiGT8x6FwckUL2Y+fOemusA/fsB
         pboNEz6Fmf4pLm0MUZHpcaQtvnuTNeBEg6CCgdOuxUgOJXGCLWFWzLKnhwng7A4iA6xS
         nbu1VGGfXSfnuDJLAotPq1KTB/gBFrwjAwHAHqCkK18XtWI7t28PFXyJJv1dKNyjzXpL
         Sh4D8qgRRYkblGL2ivv2GYk0018b8pMGpz92l/ILhXVcM2V7YNro9ptukPAO+P/f0VnC
         qRag==
X-Gm-Message-State: AJIora/UlRgCuqegUrMc+zCN/66mpVsZ4JWuRYH3wZIbHsus2CoFjuf6
        OjVV2ie8DGZz7qlwol3jH0VzRI+aqe4=
X-Google-Smtp-Source: AGRyM1sserkasnCvcWe2wavTO7DK7SCSmORTRv5BfBxvnvikH5TZAQzCe2lGxG+3xFNksRYo+I3p+Q==
X-Received: by 2002:a17:902:8547:b0:16b:df3b:203 with SMTP id d7-20020a170902854700b0016bdf3b0203mr19929652plo.137.1657578756443;
        Mon, 11 Jul 2022 15:32:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fe1c:af2d:8734:b8ac])
        by smtp.gmail.com with ESMTPSA id t16-20020a170902e85000b001678dcb4c5asm5264613plg.100.2022.07.11.15.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:32:35 -0700 (PDT)
Date:   Mon, 11 Jul 2022 15:32:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: iqs7222: Use central 'linux,code'
 definition
Message-ID: <YsylAamTIZcfkxNG@google.com>
References: <20220710024713.17275-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710024713.17275-1-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 09, 2022 at 09:47:13PM -0500, Jeff LaBundy wrote:
> Channel events adopt the newly centralized 'linux,code' property;
> slider events should too.
> 
> Fixes: 8ac14d2c2d81 ("dt-bindings: input: Centralize 'linux,code' definition")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
