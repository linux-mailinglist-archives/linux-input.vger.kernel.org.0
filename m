Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2CF5558C95
	for <lists+linux-input@lfdr.de>; Fri, 24 Jun 2022 03:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiFXBFd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 21:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiFXBFc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jun 2022 21:05:32 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5ADB5DC2D;
        Thu, 23 Jun 2022 18:05:31 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 68so973672pgb.10;
        Thu, 23 Jun 2022 18:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b6YfkAInZJ9eCtVvTGe//6bKYiurIc0TAiUY+/O7IEo=;
        b=RfqEe/peYYcXYDGN1HNGm1j8nqCE1lVQ4EErqcVao6peY1dh7JU4IVBIm/yhJfinKv
         mVaLaykgfGZ9dYb6DUILt7SMJhuPowdviTCjEbt69EtyJtA9qpBdk4gEnmzD6WLYnKo/
         Y6L5jbAM6M4Gi8H+Do2qg6nAMm6Zlvz+9W24BBLHj3kD6f58xu8ic3iWlGlrrk+LlqLH
         v4lvVSXLrOIKB3/HZXjf9mB7UITJQREtqvy+PBfRrvsqPS3t7XRBTn5Mr0aX7WjM7r8m
         udGFl2uPKW77yavmz3khaK32S82tZ1A4of2I2kSXB+TyL8aET1P1U9StFNG21iB1EF0p
         6aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b6YfkAInZJ9eCtVvTGe//6bKYiurIc0TAiUY+/O7IEo=;
        b=TNjQxl/9z6JZE17os9ywnXvIDgAbstZPQfmOroFVUBERvwd5M5cdzKS9UsefEbqz1v
         n24slx3IaqkGLOgg6OPawMmqSUOJbrcrSlzsE7PFaiC+uU6qYaFN5D0kKvyhfGtYerO+
         zyXGF6mel5VA2xQP2RmUoA6YZJXi0xCsGWzBqGdxq7PljDepUgI7CIcHJQXgCGgorEJr
         l26JFjGddJ7YtUy+7CyNq8ByzPHCfDXFV4P9a+XHC2Tixk0GSj7U9IiS6ypbgJp/vdHg
         rB+wJN4uZ7maztby2eHlg7RwqzxTSmmtpS5T796gaRMVWP9p2FYBknFRqpQghEJbfNKP
         C4Xg==
X-Gm-Message-State: AJIora87HNHq47Tg5EmWMZxs7xvYcsAXsGs5n+BKk+K6xxxq+xxZUhmQ
        tTeZEarW1K4feV3hUi1u6rvtnOmGUsU=
X-Google-Smtp-Source: AGRyM1szqBXmM41v3C8PjGgKdEqxGF5mnhk6s79EP+EcPwS7S4Nu1VI6lXWNOO3kfA6asN0Vsz/53Q==
X-Received: by 2002:a63:7a5d:0:b0:40c:fcbe:4799 with SMTP id j29-20020a637a5d000000b0040cfcbe4799mr9745901pgn.297.1656032731008;
        Thu, 23 Jun 2022 18:05:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:96d9:dda4:3142:7c7a])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902e3d300b00163f8ddf160sm411377ple.161.2022.06.23.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 18:05:30 -0700 (PDT)
Date:   Thu, 23 Jun 2022 18:05:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] Input: iqs7222 - remove support for RF filter
Message-ID: <YrUN115qdy14sfEx@google.com>
References: <20220623035309.39528-1-jeff@labundy.com>
 <20220623035309.39528-6-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623035309.39528-6-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 22, 2022 at 10:53:07PM -0500, Jeff LaBundy wrote:
> The vendor has redacted the RF filter enable control; remove it from

Did you mean "retracted" by chance?

Thanks.

-- 
Dmitry
