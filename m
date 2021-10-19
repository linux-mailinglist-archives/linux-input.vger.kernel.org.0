Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF3443426F
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 02:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhJTACT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 20:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhJTACS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 20:02:18 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E29C06161C;
        Tue, 19 Oct 2021 17:00:05 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o24so7735026wms.0;
        Tue, 19 Oct 2021 17:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fdSx5Tr0OAUB8i5PP7sreZsmKBxtxeN6rBPYKE7Ylks=;
        b=IzjHvAVRH07fMRosXkr8GF9mdBoKnTaQagr1jELPu8AT1XlCUbdlekudHk5QTYiG4L
         qAVnyvLyOVTaqaX0ISvVWoYILzNlYsIEt1TTQzC6QLWlBqHA2g4O4+IBZgBCWro9j3m7
         +28dXsFPnK/UQhvHOMHjmVz1uWVC5NqB3+JKlW9Trqjm8J8cr3OMQkzfqAxGeiL7/A9l
         m7vjOtpSn8cKlNYW52v4kORKLd4m7OI5BhfmjWrGZfyNnGNSvCeQM0HRp7iaI4P5aHYi
         T1nOxMvWoLQOfzeJPIoxI0lwOjvQcBNxYKdEN63k4WreV2nb10FS6UeCUANihBt/IioY
         sAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=fdSx5Tr0OAUB8i5PP7sreZsmKBxtxeN6rBPYKE7Ylks=;
        b=UFCVfnDYlkXW5RUkG3N8ztPCgTAgvL81TH/HjkGXe19zJxGK2CENr1fvdq2x4yHJQZ
         QknZW9Rxd/475Hau9cjFA8QXgSVJS+OO7iwfDfObcerfq07QBBxvAI3gQTivGfwoa98M
         m73NHl46j68fZ0B4WsicCtQ5J6lGlLvEyGZNtAwgI8/5cehwNN8GMBvPhHGYedcD0gUy
         dujxoi+sc/NXIzeUJWBozNym9W41JKSs0d/sDFtTrCcZtPwFwhO+2HfVfvXSLyjIMEZs
         72dfuFKft/M9ONjDDnJLCyMj/5G+PZq82xC9tqPrTIHE440T/MZD3CRd17nz0irQzmoL
         vLaA==
X-Gm-Message-State: AOAM532CNUjtCSzn6J17z6iO+zpPjXR1y2/Q47FdK7Fdot2rf80F4WS+
        V4IxFofDAkDzo+bX+KSTc9I=
X-Google-Smtp-Source: ABdhPJxsa1+5V6yCXV7+hZjk5O0EDfY9WgcrvNj+aF8ZyRm1x5SjpphX2UL5HIb2qdkgX+KkFB/Urg==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr47310441wrs.370.1634688003984;
        Tue, 19 Oct 2021 17:00:03 -0700 (PDT)
Received: from localhost (242.19.86.79.rev.sfr.net. [79.86.19.242])
        by smtp.gmail.com with ESMTPSA id s8sm421181wrr.15.2021.10.19.17.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 17:00:03 -0700 (PDT)
Date:   Wed, 20 Oct 2021 01:59:43 +0200
From:   =?utf-8?Q?Fran=C3=A7ois-Xavier?= Carton <fx.carton91@gmail.com>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U gamepad
Message-ID: <YW9b7wMu8c4Y/lQ1@reblochon>
Mail-Followup-To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20210921150837.ingexwsauvxgluca@luna>
 <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
 <20211019092737.kudgdeulghx2ig3m@luna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019092737.kudgdeulghx2ig3m@luna>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Oct 19, 2021 at 11:27:37AM +0200, Emmanuel Gil Peyrot wrote:
> I don’t see any existing driver named that way in mainline, would it be
> acceptable to simply rename the current patches to hid-nintendo?  What
> should be done about the existing hid-wiimote driver then, should it
> also be merged alongside?
> 
> Another driver I’d like to submit eventually is the GameCube Controller
> Adapter for Wii U, which does exactly what its name says, but being an
> external USB adapter it also works on any USB computer; would it make
> sense to develop it alongside the current driver, just because it is
> sold by the same company?
> 

FYI, I've submitted a GC adapter driver previously [1]. I've been using
it since then; the patch still applies to recent kernels. I'd be happy
to work towards having this driver mainlined, if there is interest for
it.

[1] https://patchwork.kernel.org/project/linux-input/list/?series=282859&state=*

Best,
François-Xavier
