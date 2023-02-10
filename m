Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0232669297C
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 22:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbjBJVrS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 16:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjBJVrQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 16:47:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D705E60D4D
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676065589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yeBqRHWBFW/W6zcgOs15ap2pCqXCzUT82hYzoMn6pzs=;
        b=GRmxvBpNWMMKQnhpjG6p+K9gF5jNe5wLmu7RZDzNFcEHbmZx9Xbtv1tzuNGyLuODQPhhoz
        9WoWqcokjGEw8IXLZQFT8Q3D9cXaguegyiEyKy4tmsjztFHk6Inu0Ul7vDVeM4kVN5LGE+
        oPiavQ9Dt6q2suppunCAV6yEUd25cd0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-C0Xb-ORaNnySSrRczXljSA-1; Fri, 10 Feb 2023 16:46:27 -0500
X-MC-Unique: C0Xb-ORaNnySSrRczXljSA-1
Received: by mail-qk1-f198.google.com with SMTP id o24-20020a05620a22d800b007389d2f57f3so4116131qki.21
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 13:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeBqRHWBFW/W6zcgOs15ap2pCqXCzUT82hYzoMn6pzs=;
        b=OK6LF9xg2ItSwGi68sWwI9iWCX9tdCN4OGvRv2JDWeFo4yy+03kq3d/3DuPzaGO5pM
         +BvS8/wz6+RX2C3XWO7PTJ/0Ymv4czor5R1NvzC4xbi1yHoNPLxdCn0/Thh2yWwNLSxn
         rOpjQC81pxKfhiS6om4173gDaT/B4sX6LdiMJggGbEtraFPR2WjrkP+goBKOY+RnRbBt
         AHDtAzgM/FFzU+zGBJopppn0AxbAWr2G/tSXL1/LpqY+/4+L1qDSm2HSFKnlyIpouLnJ
         rQKwdtLj8EDsStvbBUH9JQDO9yCSwA1wm59FLTspluc+uS9cMBQYxsanCxE8kO7YeLnh
         ooUQ==
X-Gm-Message-State: AO0yUKVeN1O7iDp2IwxvS/h6OXyvTvWbvqf0be8felMt+BWlUWLefXjs
        JKHqkBErHWKWRxk/WtjXE9/JumYYFAmQWpY4FqkFl4RgOvZIY/6Fn66W35fMfUE9nObMJV8+Ate
        DJORfkOLyjr+kWzIENLheHog=
X-Received: by 2002:a05:622a:316:b0:3b9:c0b4:8afe with SMTP id q22-20020a05622a031600b003b9c0b48afemr13934199qtw.2.1676065586779;
        Fri, 10 Feb 2023 13:46:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9dirlhYVllKKLtEyP1JvXL7a5VVA95AMW2+DKGwjq57YBYAOeLnLAJKQolVRq/XKeLf5CBHQ==
X-Received: by 2002:a05:622a:316:b0:3b9:c0b4:8afe with SMTP id q22-20020a05622a031600b003b9c0b48afemr13934173qtw.2.1676065586525;
        Fri, 10 Feb 2023 13:46:26 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
        by smtp.gmail.com with ESMTPSA id p23-20020ac84097000000b003a530a32f67sm4137144qtl.65.2023.02.10.13.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:46:26 -0800 (PST)
Message-ID: <a80e8eb64e93205bc261988de0834b38d1d82222.camel@redhat.com>
Subject: Re: [PATCH 1/3] Input: xpad - Treat Qanba controllers as Xbox360
 controllers
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date:   Fri, 10 Feb 2023 16:46:25 -0500
In-Reply-To: <97e640ce45cc116b9877efda43117640fd323855.camel@redhat.com>
References: <20230203022758.3982393-1-vi@endrift.com>
         <97e640ce45cc116b9877efda43117640fd323855.camel@redhat.com>
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

Almost forgot to mention - the Reviewed-by here is for the whole series, no=
t
just the first patch :)

On Fri, 2023-02-10 at 16:45 -0500, Lyude Paul wrote:
> LGTM. For onlookers curious: the audio interface being disabled here isn'=
t
> currently supported in xpad quite yet, but is supported out of tree -
> supposedly with plans to eventually merge it into the mainline kernel. So
> patch 2/3 here should be fine.
>=20
> Anyway,
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> On Thu, 2023-02-02 at 18:27 -0800, Vicki Pfau wrote:
> > From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
> >=20
> > They act that way in PC mode.
> >=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  drivers/input/joystick/xpad.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpa=
d.c
> > index 2959d80f7fdb..bb65c8268963 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -492,6 +492,7 @@ static const struct usb_device_id xpad_table[] =3D =
{
> >  	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
> >  	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
> >  	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
> > +	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
> >  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xb=
ox */
> >  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
> >  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

