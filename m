Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F43C2D0A7B
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 07:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgLGGAp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 01:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgLGGAo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 01:00:44 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460F2C0613D2
        for <linux-input@vger.kernel.org>; Sun,  6 Dec 2020 22:00:04 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id t8so8717949pfg.8
        for <linux-input@vger.kernel.org>; Sun, 06 Dec 2020 22:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FSRcsfhnT34AUr1qIdAVppdM1vH49cOHDdV2H4oEXt0=;
        b=p3mX7qqFIuJaYdo+EAZY5rBMzw7uNyOjo3LyfQ3d5jHMp2mvaMMgjXHVwt7oXOphwe
         T+7JJacqB9gBN1bUFuY1uVdKe+LomXtIW+mj3UhxwZLUWb6p6vqWrRGcix4lj/6hy1du
         YHhvbQwC6aqtxHeh9vOh+JIEHdV/2P+HfEK0UsqaosVg36Y+IHApVLl1jrC1MP5roioL
         geUeUJ57v/b0eBGhlAI9bx+MAP2bN1wUTCV/WWnlCCc7J3U6gL4EQuXOPXex/2WlR2Qy
         n5m7G9v4BFlNjDSifGRj31rqG27eVl6DEXfpxfx0IOGgfl5e0xmdfEQH/U87b1A5pe0j
         ENoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FSRcsfhnT34AUr1qIdAVppdM1vH49cOHDdV2H4oEXt0=;
        b=BY+OaQtjiHmeNwIud5vX9JySaFqDKa30F+Yohz8m1UZQg0pt06c2Mr4vCQUtwEXY+B
         Y76whqoBdbUCaFtfVfp026wAZb6d+DI9vkEPg/F82sINevWzRK4BlpdP4RCXptPrmY/j
         McrleGgW4rH+ZKwS3XVvM5gf8nqDMplNa44wcBy1tEEZka3uAJ9vB7wkKuPTny3rPz2F
         2le8ZhfS4me5O1V3CDL/9qa/3zY8Xjx0faIzVLFgb1CrCEOVYq79Nj3xGfPoY6B4UV2S
         3z1HDl2653Uq1TmJUYNjBcfTxrqj03SZs/I9wG+Qr10Rf/gEaivyqGNPW/sm9IZvJR6W
         /XNQ==
X-Gm-Message-State: AOAM531Q08tpoff7COw5NmC6Izx5ISeC5n25WrXcI2iC6uiMp/LnbAqe
        ujG6QRveX4FWiwL6U6gqJlY=
X-Google-Smtp-Source: ABdhPJzq9KlIe3tipVeY4SsfI/OFbUnxDheuVPNQ8m9tZo1rImgFyQIlsYAaFizVwg/vSHtFusVtjA==
X-Received: by 2002:a63:3117:: with SMTP id x23mr15068606pgx.38.1607320803214;
        Sun, 06 Dec 2020 22:00:03 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i29sm11295377pgb.10.2020.12.06.22.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:00:02 -0800 (PST)
Date:   Sun, 6 Dec 2020 22:00:00 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: soc_button_array - Add Lenovo Yoga Tablet2 1051L
 to the dmi_use_low_level_irq list
Message-ID: <X83E4AB5sfxoeYFP@google.com>
References: <20201206161245.24798-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206161245.24798-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 06, 2020 at 05:12:45PM +0100, Hans de Goede wrote:
> Add the Lenovo Yoga Tablet2 1051L to the list of devices where the
> ACPI AML code is poking the GPIO config register directly changing
> the IRQ type to a low_level_irq, which we need to work around.
> 
> This fixes the home button on the Lenovo Yoga Tablet2 1051L not
> working.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
