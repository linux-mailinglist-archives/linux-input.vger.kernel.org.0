Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6445518A14A
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 18:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCRRP1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 13:15:27 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43953 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCRRP1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 13:15:27 -0400
Received: by mail-qt1-f195.google.com with SMTP id l13so21329372qtv.10;
        Wed, 18 Mar 2020 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XxUwJet0pq87ma5H9uRR4f/E0DxPaM/eAomJtt++Wdw=;
        b=DjBEsemG/jKOqxSvxcsYq29zun7ypTmpLQlvI1ddnFGNppkBPa5778wjuKJKsZDGlu
         3Zm27jDFWKiXsSrxlqDpU0nCfpXFq2gC5OZ5+clXqP2yVzZqFyURbzLOQ93CI51pWG5r
         Di+n5FOGn5h7LsdwPHcDObhKKDPaj3lRBf7PkJ39kkAmlfG1JSSZxddsxreA8dI77JZ7
         aag2l+kVpPGquTTPvRAa9cAOgvquAR4UEyW8KQIo6igUQKOsQdLGggldAUrMRvfFkkCj
         bjMNzxka5ko2dwdp4jpNCfKcvPnYk2bOGYJwVhDEzwIKwazryU1nhaiFpECKnPKdBXWU
         J0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XxUwJet0pq87ma5H9uRR4f/E0DxPaM/eAomJtt++Wdw=;
        b=fg89ukY5udxVRVRkaWkyz+YVgtKPB92h0fit/BjVUvtNAvwUwQ2GYLTP+lMiey+K1f
         WNnFpd9EK3yJ5eLdoGoUz7i6ZaI06yl2bOP5CfFWVFz5qoIcp4D/R3drKKWdSblMa8LZ
         ekFDQnZ8OaOacytE+AZEmVTSWR1kEg5l1J9zbMrP9YWWFhHnZzpy8mNz932Qplf/938Q
         5o+gidkHkJl30b/4/dLqRUsNUrxe2Ff88cROr2u/pxV3DRw5+cwHDsvXT0vBInz5ZrkA
         ZDi0yHTlNjrr5RwFcY8OGVLPCvkCIVr/1qYRNuEBGLEvimz9bZiYoK6XEfcTaX/i4VC0
         b7Vg==
X-Gm-Message-State: ANhLgQ3H2YbXJVgyvEBN2PaFIGJUsb12ZTzhw3o60OaIr0C1P3baaqvy
        yndEq7OBQgtEslq7tgKbaQW9OlYxGswWJwbz6BU=
X-Google-Smtp-Source: ADFU+vt0lA5e23BmYcHnV5pD6m01L7MMTzT6+01UMHNRW+Plra58xvGh+bWIyVnJwqF4bumOrQysBnWAjSiMiv7iXmM=
X-Received: by 2002:aed:200f:: with SMTP id 15mr5587101qta.152.1584551724821;
 Wed, 18 Mar 2020 10:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200318161906.3340959-1-lains@archlinux.org>
In-Reply-To: <20200318161906.3340959-1-lains@archlinux.org>
From:   Mario Limonciello <superm1@gmail.com>
Date:   Wed, 18 Mar 2020 12:15:13 -0500
Message-ID: <CA+EcB1MoTXMaueJfRHf51A5PU4oiKSJXrHazfTEvifZK54OrLQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: issue udev change event on device connection
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Richard Hughes <hughsient@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 18, 2020 at 11:19 AM Filipe La=C3=ADns <lains@archlinux.org> wr=
ote:
>
> As discussed in the mailing list:
>
> > Right now the hid-logitech-dj driver will export one node for each
> > connected device, even when the device is not connected. That causes
> > some trouble because in userspace we don't have have any way to know if
> > the device is connected or not, so when we try to communicate, if the
> > device is disconnected it will fail.
>
> The solution reached to solve this issue is to trigger an udev change
> event when the device connects, this way userspace can just wait on
> those connections instead of trying to ping the device.
>
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.=
c
> index 48dff5d6b605..fcd481a0be1f 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1464,6 +1464,8 @@ static int logi_dj_dj_event(struct hid_device *hdev=
,
>                 if (dj_report->report_params[CONNECTION_STATUS_PARAM_STAT=
US] =3D=3D
>                     STATUS_LINKLOSS) {
>                         logi_dj_recv_forward_null_report(djrcv_dev, dj_re=
port);
> +               } else {
> +                       kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
>                 }
>                 break;
>         default:
> --
> 2.25.1

The problem that will remain here is the transition period for
userspace to start to rely upon
this.  It will have no idea whether the kernel is expected to send
events or not.  What do you
think about adding a syfs attribute to indicate that events are being
sent?  Or something similar?
