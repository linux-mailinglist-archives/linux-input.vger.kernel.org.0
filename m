Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A106C725F
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 22:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjCWVej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 17:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjCWVei (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 17:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7493D61A1
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679607240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lyj5KX6W8CXVCHd6vtu5Qt9SLA6lUm5JYyJSnTFuY18=;
        b=DK0WSt+BP99MyuMWybRps2OEq6TcZ0xAjdxdf8qSrpGXfyzkVAZmPO7SzBrcTrqjme7REV
        3X3FibAlQLP+Ov23VZdTOM1K+S+DHM99ygW2lAvhoy4ObVqb7n6MLS8n0EEZ14Ef/yaO0W
        NPrch1czRfEhUtesm2sR3+fnfzl7+GQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-FeAKT6qqOe-BOFFKk11cng-1; Thu, 23 Mar 2023 17:33:59 -0400
X-MC-Unique: FeAKT6qqOe-BOFFKk11cng-1
Received: by mail-qv1-f69.google.com with SMTP id e11-20020ad4536b000000b005a9292e8c2bso101940qvv.1
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 14:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679607239;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyj5KX6W8CXVCHd6vtu5Qt9SLA6lUm5JYyJSnTFuY18=;
        b=5t/w4ZMyjxs883UQImWTsFN+Tz8oGzeLQviToP1QQz+TzbFUqiF2sbg39LK92gl3v9
         YeEQXtE1RH6vSm+R4UPa203APEbFkqx+MI5xUVp9V2j+s0erzs3/9OhJJXf/omuvFNzt
         HyEgJXSzvv+ZNwVbVTNaJM0jQOhLqL+gJVwG0a/1VWcYSwPtudS8ndfuWIfZY2c1Kvnb
         sMNVMh7/H9/3AxxiOL+swLE4HSMX8lUy0C3K7eI+l2H2t6GlOe0tHrZKryt6KEWl792e
         p3LQ/KNZaLl/TpJnHQKhn0gp3p6o+ykIBdPXNvoc21IMGtXVSuKY1yvVkMAar4cdM/P3
         21sg==
X-Gm-Message-State: AAQBX9dKs/X10QsMUBIt7s/H8brRETKuVy5cS7ljJZW2o8K8mFP4/Bh7
        djxC7mHL4fEIVY0yBDOI8O2eV551CWCmYzJxu9TIjWQzZoA3tI/h7NKRSA2uoxIhgX6fREocg5J
        viD3hRts0HFliLe1Kt0uHDdRddFfaLoE=
X-Received: by 2002:a05:6214:2b06:b0:5da:2e2f:8e29 with SMTP id jx6-20020a0562142b0600b005da2e2f8e29mr527653qvb.42.1679607238770;
        Thu, 23 Mar 2023 14:33:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZbysEeeFR4r45Fr87rvGQd9Mv8aIdPd++6Zk2K9vNZoyGC3Ke0xzS4az/ulw0Fd1VAmWA3qA==
X-Received: by 2002:a05:6214:2b06:b0:5da:2e2f:8e29 with SMTP id jx6-20020a0562142b0600b005da2e2f8e29mr527623qvb.42.1679607238521;
        Thu, 23 Mar 2023 14:33:58 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c57:b700::feb? ([2600:4040:5c57:b700::feb])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4408f000000b005dd8b9345b0sm169234qvp.72.2023.03.23.14.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:33:57 -0700 (PDT)
Message-ID: <b2c7f5d262e9e16c51f385a5d1d632640f71fef0.camel@redhat.com>
Subject: Re: [PATCH 1/3] Input: xpad - Treat Qanba controllers as Xbox360
 controllers
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date:   Thu, 23 Mar 2023 17:33:57 -0400
In-Reply-To: <20230203022758.3982393-1-vi@endrift.com>
References: <20230203022758.3982393-1-vi@endrift.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, it looks like this patch series has been sitting for a while now
without getting any kind of feedback. Could you please take a look at this =
the
next chance you get?

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

