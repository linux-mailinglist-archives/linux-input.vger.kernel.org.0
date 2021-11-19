Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1F845721A
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 16:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbhKSPwD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 10:52:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhKSPwD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 10:52:03 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C500C061574;
        Fri, 19 Nov 2021 07:49:01 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id b12so18879120wrh.4;
        Fri, 19 Nov 2021 07:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=meEjyOFEk8NLwqmQYbedVmiXvkxGhx3w8P4bOKYAV/Q=;
        b=qrgfQVMTtExx+nPYfWUhM3GkoqKoggaX20OQRUwYcalgg+n8coEr2frtfljckN7C9V
         Py30PwdeXK4mYpM0PpjiTHnUzN362xqXFU5sTXmVBfHiv8MkKuqgouYu9b/nirUS0FO0
         VYpq9YIzG9KwCwNt0GcfQf57Fv5hCHof1yjk86S0uXWzzxFDxEuALSK4vu1taQGE9WaS
         U6H2cbJQLYBSEMypRuglCYr7xIqmeX5KSOVaZo37bcZ7yxm+K3FXgvZJeRAZLxd4q/le
         R3TGHFlmisk9jEyyLNg+GewPe66cN8M3Ars9GQHoWqSttx1vhx5d2IR2r+20tlCzKa6z
         IjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=meEjyOFEk8NLwqmQYbedVmiXvkxGhx3w8P4bOKYAV/Q=;
        b=tVLZsirBYToizNKZVXoNxulaDUqwi9IcucrX+vKHfNy0KeovHGM7RqBjNMCpILNfJM
         Vgmyz5M9xIJ2Hf+4H+gUrmwugBwo2BAfRZpKDq5W26wPpHiDG/AFXjOTwQbLvJkZwNT7
         f8izh0yvYQ8M6fvnSkx6JD5KMdb+imVAly2qEpiUiAX0v40VC8WJeS6AysAJ94Cq808R
         dioFzzEPQHG1pxGidWLZGdZuEMQL0A09Y+rGdRCd0c8vvUX+CWH9SRzqnU+F+eaKSFEv
         Xosdvb2Z/z5gA/IsqtNv149qi5fJXzGwcV+pOS0+rUHZxkyUJRjZPpURDKrXdw804TSE
         taUg==
X-Gm-Message-State: AOAM531jkT7+UkRAJFhMgck1khOqauDATNifTzh5WqYDrebhHAjhac2s
        wKDAoRWj/0fKuXJ7Oh6mKGtcBjMCR7i/tg==
X-Google-Smtp-Source: ABdhPJyi+uZ1amKREnxjcMgf1RhYUF7WME7H0ITXU52PZrELCYo3ygvIGD13OHR893HvJtxjjsH2Kg==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr8808652wrf.344.1637336939749;
        Fri, 19 Nov 2021 07:48:59 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id l5sm33096wml.20.2021.11.19.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 07:48:59 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Ondrej Jirman <megous@megous.com>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4] Input: sun4i-lradc-keys -  Add wakup support
Date:   Fri, 19 Nov 2021 16:48:58 +0100
Message-ID: <2604187.mvXUDI8C0e@kista>
In-Reply-To: <20211119025415.18642-1-samuel@sholland.org>
References: <20211119025415.18642-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

Dne petek, 19. november 2021 ob 03:54:15 CET je Samuel Holland napisal(a):
> From: Ondrej Jirman <megous@megous.com>
> 
> Allow the driver to wake the system on key press if the "wakeup-source"
> property is provided in the device tree. Using the LRADC as a wakeup
> source requires keeping the AVCC domain active during sleep. Since this
> has a nontrivial impact on power consumption (sometimes doubling it),
> disable the LRADC wakeup source by default.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


