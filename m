Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FAE650D01
	for <lists+linux-input@lfdr.de>; Mon, 19 Dec 2022 15:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbiLSOHI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Dec 2022 09:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiLSOHG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Dec 2022 09:07:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3969AE0B0
        for <linux-input@vger.kernel.org>; Mon, 19 Dec 2022 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671458779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nuVjVLBj8E1x4HBavhbBfOmlBo2lVvbRsYo3c8J2IAY=;
        b=WPlslR2sfJyybnqaST83DyUehC+1G7Rb/WKISwLvR4FjYN7EtReBoPVUNoNwTyesBOoYGn
        /uovASfJFScM8VxrXyvBBhOHYUYCg6O2xyOPaGiYgfaz56A9PlRpaKr6rWt9hmTrRe2pOu
        CPusgIXWwXA/7xIHliVBKZ9NQrU2SVM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-05pXtdqLNAK06ZtBJSAfIQ-1; Mon, 19 Dec 2022 09:06:18 -0500
X-MC-Unique: 05pXtdqLNAK06ZtBJSAfIQ-1
Received: by mail-il1-f197.google.com with SMTP id r6-20020a92cd86000000b00304b2d1c2d7so6582188ilb.11
        for <linux-input@vger.kernel.org>; Mon, 19 Dec 2022 06:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuVjVLBj8E1x4HBavhbBfOmlBo2lVvbRsYo3c8J2IAY=;
        b=zaI5K3aVs8aNT8Bbr5K/0RTlA80rE19X030x9E8NG8fPmMDalbOvr9Z+vSnZMv2LkD
         eo5KV4DLDZ2qNlhULi70cPCUzNZM3Wa+oTOBzAeYFcAkfdhz4PQAm2sRCTaCbxL/4/Ds
         55nyvVjyYr2qt8i8hEmSejwbfN6tzR1hWpxXNu2wsGdhZgeWAb7t2ZiejNSNCWir4SHB
         tP3DlpKQ3h/jltq44VDb8UQDDti1iFLaq1W1v5ZE69Ni1NkS4PbWnyMq/tYa2bzsM+tW
         u1Fm21T6DXDWNewrpbVESzziv1bVhki22QmdO3jTjG3vlHmE8vQx2hcfLm5Np//N559w
         0K2g==
X-Gm-Message-State: ANoB5pnFUoDXWBr6rO8edh7PY5Kh6mO3ZxvK4bCjSnIg+XJvVY7jVJw/
        5dATHfMBAf/jPmFn+Ong9ak+5jjZlf2obEohEiXwbwKTTmCSnHz6tzaV8+/1C7cLtLLN9r9PpNT
        VXT/5/2y2C0gAc+DKRU9f2SJZXZpRSZjk+eHMpP4=
X-Received: by 2002:a92:ca8d:0:b0:302:de10:7ae1 with SMTP id t13-20020a92ca8d000000b00302de107ae1mr37983334ilo.15.1671458777000;
        Mon, 19 Dec 2022 06:06:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5HsqW3uYLj3Z+BSfkHisqf8EAo68havrtSEvHFzsSQz53HGMcIdhS8KxdYoPUtoUD8VI3yzwO/jE3fe1h0XZs=
X-Received: by 2002:a92:ca8d:0:b0:302:de10:7ae1 with SMTP id
 t13-20020a92ca8d000000b00302de107ae1mr37983326ilo.15.1671458776758; Mon, 19
 Dec 2022 06:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20221215154416.111704-1-hadess@hadess.net>
In-Reply-To: <20221215154416.111704-1-hadess@hadess.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 19 Dec 2022 15:06:05 +0100
Message-ID: <CAO-hwJJefrHHkffo2o1bq1iJCQJe2-Oq3PZ0to07RS0U-xA5Sg@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Guard FF init code against non-USB devices
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 15, 2022 at 4:44 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> The Force Feedback code assumes that all the devices passed to it will
> be USB devices, but that might not be the case for emulated devices.
> Guard against a crash by checking the device type before poking at USB
> properties.
>
> Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---

I have added cc: stable, and applied to for-6.2/upstream-fixes

Thanks,
Benjamin

