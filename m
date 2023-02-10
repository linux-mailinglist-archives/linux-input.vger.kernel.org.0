Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7069469297A
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 22:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbjBJVqr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 16:46:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbjBJVqq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 16:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C864DE3D
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 13:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676065557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qkp/dV8vBwoOk8o3OqFIQ8IYu6nm9h2UAKn1tCtGfB0=;
        b=cYUqITjQ+j7RRzQPggBEmYQ0LdpLbVeuMnS6g/WRsWITHydAD1PtFAwsVQTSTUd1sxhJxQ
        3Y5KJkQacxyOWDjXiODQmLbxlS1uSCbHd3WoN/JOp9tX7b8E2H0gctinjQJbZWm7rfiUo+
        Qd4fEGYWbKMwwvxxwjPvOvHB3Rntj2w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-HEImPfADM1WOb2M2n8h1eg-1; Fri, 10 Feb 2023 16:45:56 -0500
X-MC-Unique: HEImPfADM1WOb2M2n8h1eg-1
Received: by mail-qv1-f72.google.com with SMTP id ec11-20020ad44e6b000000b0056c2005684aso3929926qvb.23
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 13:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qkp/dV8vBwoOk8o3OqFIQ8IYu6nm9h2UAKn1tCtGfB0=;
        b=bMoPC1U6PhsqNjGDCDinwBIc0zwg1dFH7DJgx8mWX0PleUs3O1UMbc+BjDo7SuSd9x
         gbZjw0FDPyC6pV7/w9PQ6aBadSx8xY4U3JAm2YMPxLrKGFg4vKvJof1umTxasWIqBBQt
         Bzq9CiIu0gZLDJwJ8/UWyz2RR2OblhM8dJLqbcu2l4JMyCwtSa42sP3v6cqWF8UFh/xv
         qR2VyBljeTA6CntAcE6+oSwtf0Yq7+fuHALKbTfgafiI0aoTomHf11lkCxVYjbX3ZD0k
         hzUyi3IaXmhkR1e9hLWu2bkt7i/y+pQPkdh3z0vmcE1rKmrAfwITUWzKLoziUX2nfLtj
         QPJA==
X-Gm-Message-State: AO0yUKW42g7z9dUPm8wnpjfMAmYsyBpPTvhVOnOlssFT5m4yvI9wiKQT
        2GAudpZiugLHo+hHCrSpIDzbMtyV14ND6/ZlAFIbVwPE+BCEonH2pFi3O3YJBz8AgMy0DAu78ob
        ryBlyFQeYW093IDl9O0k9fFYtsptR
X-Received: by 2002:a0c:ef51:0:b0:56c:2344:a58b with SMTP id t17-20020a0cef51000000b0056c2344a58bmr11880176qvs.12.1676065555515;
        Fri, 10 Feb 2023 13:45:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+xL2BwqbXOx3N6OESynliNXjk6xXkGMwBjHmKS+Hh5x7ppPIKcHjgj6q7BgRKh65JscIqX+w==
X-Received: by 2002:a0c:ef51:0:b0:56c:2344:a58b with SMTP id t17-20020a0cef51000000b0056c2344a58bmr11880163qvs.12.1676065555275;
        Fri, 10 Feb 2023 13:45:55 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
        by smtp.gmail.com with ESMTPSA id a19-20020ae9e813000000b00728bbe45888sm4370557qkg.10.2023.02.10.13.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:45:54 -0800 (PST)
Message-ID: <97e640ce45cc116b9877efda43117640fd323855.camel@redhat.com>
Subject: Re: [PATCH 1/3] Input: xpad - Treat Qanba controllers as Xbox360
 controllers
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date:   Fri, 10 Feb 2023 16:45:53 -0500
In-Reply-To: <20230203022758.3982393-1-vi@endrift.com>
References: <20230203022758.3982393-1-vi@endrift.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

LGTM. For onlookers curious: the audio interface being disabled here isn't
currently supported in xpad quite yet, but is supported out of tree -
supposedly with plans to eventually merge it into the mainline kernel. So
patch 2/3 here should be fine.

Anyway,

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-02-02 at 18:27 -0800, Vicki Pfau wrote:
> From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
>=20
> They act that way in PC mode.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/input/joystick/xpad.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index 2959d80f7fdb..bb65c8268963 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -492,6 +492,7 @@ static const struct usb_device_id xpad_table[] =3D {
>  	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
>  	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
>  	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
> +	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
>  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox=
 */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

