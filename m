Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A27B61FEB5
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 20:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbiKGTbr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 14:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiKGTbq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 14:31:46 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED16725C40
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 11:31:45 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id h193so11307030pgc.10
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 11:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BlUukI1K86KGwh/c9Vea7YEZBxm+Z5XsTn9Dsx+MUeo=;
        b=HMCsAfKvhQLZirRXFLkb115vZlXwRuC7KudaQMRDP0MeKWM49mn1dQXODRcfquvFE/
         st1/Ej2gEcN1NMrCOgblSwESpzrLOJeVUXrMPdfacp4ZpNIizFB46X4CqhJEh4Xr/OKd
         KnT/5UDjDvJBWOQr0yj4wK0BKr9Opvn9+kOsg7LrBXQTLLtIulsaSfMHCXPRO4NJ0cXm
         qcAEP0ZQjVOZf8iaBzAzEKMHF8o19xSCp47AX62dJlq9XKUsRnTj0JVOo9IV+dq6qnZY
         pSLsplkKe7yqa5Eikrx4GAFEG9tvIbYf7flX0g2tCrnjnpT7tFRxvfS/xe+5NSpWZaw7
         uxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlUukI1K86KGwh/c9Vea7YEZBxm+Z5XsTn9Dsx+MUeo=;
        b=QP9lGUqdMRpoASGvTPzt0CWqbfdmqJSKqoc8IGTiUoLcKMIrYFgXXY04yXP59Ynd5A
         iHKLlPVxn+ZebYpn58oe+zkj/hshF286qMcXzTZ8St33kTslTpqdeJUslPQfptL5NUqV
         KdOewdwffJ4tGGGW3y/5nHqDpO+JSkG5i9oPWmTIZjgKyfo94kry1N3Wz0bjur4XPrWP
         wliZYhmF/jhDYnYvN8oo992KACW8FLvwXF5XH3TlI4TC2ZXGq5BbJSKHxvIUZq9hLm03
         gkHDlLpm3SybdmxJGY7vWK2JIBsqxeJTngUkciIBn3pgvaBK5/5232+wXJ4JyxUh37GW
         mTbg==
X-Gm-Message-State: ACrzQf2vdVPpcnIcOwVClS4rEmkJxfi0vBU2p2WPeiYrO3NSzj7T7OdM
        oDZNIEbeB6wNWgZJnw9XIrk=
X-Google-Smtp-Source: AMsMyM4InZN/hvHP1sDBwz/Oo2P0XscX5Qgnxy2c8F6XrjRp4QSHCFJ36eKl22vzDFhc1YOeuQ11CQ==
X-Received: by 2002:a63:e544:0:b0:462:2c80:f521 with SMTP id z4-20020a63e544000000b004622c80f521mr42334674pgj.549.1667849505293;
        Mon, 07 Nov 2022 11:31:45 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:626:eb80:9eb9:1fd7])
        by smtp.gmail.com with ESMTPSA id f30-20020aa79d9e000000b0056bbd286cf4sm4844257pfq.167.2022.11.07.11.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:31:44 -0800 (PST)
Date:   Mon, 7 Nov 2022 11:31:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, Rudolf Polzer <rpolzer@google.com>
Subject: Re: [PATCH 2/2] Input: soc_button_array - Add Acer Switch V 10 to
 dmi_use_low_level_irq[]
Message-ID: <Y2ldHdticjzRxSnO@google.com>
References: <20221106215320.67109-1-hdegoede@redhat.com>
 <20221106215320.67109-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106215320.67109-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 06, 2022 at 10:53:20PM +0100, Hans de Goede wrote:
> Like on the Acer Switch 10 SW5-012, the Acer Switch V 10 SW5-017's _LID
> method messes with home- and power-button GPIO IRQ settings, causing an
> IRQ storm.
> 
> Add a quirk entry for the Acer Switch V 10 to the dmi_use_low_level_irq[]
> DMI quirk list, to use low-level IRQs on this model, fixing the IRQ storm.
> 
> Cc: Rudolf Polzer <rpolzer@google.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
