Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD1561FEB3
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 20:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbiKGTbi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 14:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbiKGTbh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 14:31:37 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B899527DC9
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 11:31:36 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso11232215pjc.2
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 11:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LzM6TO6IH4mVpdYa2QDDYPvcOFUwyZa5dYIfAoVt6Rw=;
        b=Evma7EBaTLwuVH7F91iMBGgg1aGm1y4ycPOENAlPVS379zuPng+TNVW6lRk6s9SCOu
         55F9yousmPNlOCh09wUdGRCNjVI2062/Bf0zXMOabsFMmXPDBrF21T5i6/bpGenkgWx8
         /+jtDoG41Oe4VtrxvCgjySKksdbZEG0smsOPjB0VVODpoSgw6wnTBFEWtcyCnjYBGyk6
         6WSQJoCcIKTwDYKFQLrOERL/vTETBdytbPkDsclm6qwR+/+P4raifYjm4HYg7oGTTbLH
         wB2xskib/GRk7xsij78gnQF4o5f9qo43fgaFDTvCF91H6HTg50WZXWjDuRBFme8SK+JD
         QFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzM6TO6IH4mVpdYa2QDDYPvcOFUwyZa5dYIfAoVt6Rw=;
        b=sN3i1HEOn3CP/EUq4XG2RUjPB6HfA5lB/U2iEojjuw5iS5S+3YAdLljHK4mieH2dhD
         SVp7hL35QWDMpNKaCcUOQOHVeoZ67CL00JxOZwsJiAH51j1wm17pqxJyGir71i2btQNw
         BcE2q6aVBH40S9uMfJLR1yVYpIDqcJsmsVGj5SMKnRr+KpAOdXowZGJm3nnNm94Yof/G
         xLDm9AQ7NZrY09i9OuBlfYkHuEnoVKmag/yhoocQvV0OBzPJJ67z9FogP5ZboAoubEMX
         tJClVo52J35rhtVitIPhhzYq0yS70ZKD/BPcye8P27rw+3hffTto30x83uivIrHqAjF5
         gUPQ==
X-Gm-Message-State: ACrzQf2XuJIJn56Js60D5FZpdrQqOvrnfB1wZXFVTztvBBiEWVQe0tyv
        Q+N9pW5Pm2pCzbobdBfXzrQ=
X-Google-Smtp-Source: AMsMyM6Y21Z4kxM9FRWjvvgitM7Y+EXeKyQxTNsQSp62lm4UmRIL4x3xHIsXGiHYml9OcwogncCk8Q==
X-Received: by 2002:a17:902:9a8b:b0:17a:455:d967 with SMTP id w11-20020a1709029a8b00b0017a0455d967mr51024821plp.52.1667849496036;
        Mon, 07 Nov 2022 11:31:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:626:eb80:9eb9:1fd7])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b00181f8523f60sm5324694plk.225.2022.11.07.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:31:35 -0800 (PST)
Date:   Mon, 7 Nov 2022 11:31:32 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, Rudolf Polzer <rpolzer@google.com>
Subject: Re: [PATCH 1/2] Input: soc_button_array - Add use_low_level_irq
 module parameter
Message-ID: <Y2ldFI9ZLI7dqYnE@google.com>
References: <20221106215320.67109-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106215320.67109-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 06, 2022 at 10:53:19PM +0100, Hans de Goede wrote:
> It seems that the Windows drivers for the ACPI0011 soc_button_array
> device use low level triggered IRQs rather then using edge triggering.
> 
> Some ACPI tables depend on this, directly poking the GPIO controller's
> registers to clear the trigger type when closing a laptop's/2-in-1's lid
> and re-instating the trigger when opening the lid again.
> 
> Linux sets the edge/level on which to trigger to both low+high since
> it is using edge type IRQs, the ACPI tables then ends up also setting
> the bit for level IRQs and since both low and high level have been
> selected by Linux we get an IRQ storm leading to soft lockups.
> 
> As a workaround for this the soc_button_array already contains
> a DMI quirk table with device models known to have this issue.
> 
> Add a module parameter for this so that users can easily test if their
> device is affected too and so that they can use the module parameter
> as a workaround.
> 
> Cc: Rudolf Polzer <rpolzer@google.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
