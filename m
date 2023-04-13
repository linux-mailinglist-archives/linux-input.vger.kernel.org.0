Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA476E1611
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 22:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjDMUsW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 16:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDMUsV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 16:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C3C9740
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 13:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681418856;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HtJyH8SGOogFlfOnGodd9IaFOBzxhFrcUEkKoY2za9c=;
        b=d7gqhzyL1qXXWY7U8RyK0kAxMiimFvrzO5QdaDPUswC8uTlmo4Fu1OdQZOJbf4d0OGGPJh
        e/C38VZxsfYPKCVE6CPJNLD9F2hZsndEbTzQdA3bh5xZ2HPnL1qcuxuutYDtv8RuW0mrrd
        sG+jBkVR3uyJWPdcUMf/qFKI70FxVYw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-TMCSyofzMb6TWGlSMDvDEg-1; Thu, 13 Apr 2023 16:47:34 -0400
X-MC-Unique: TMCSyofzMb6TWGlSMDvDEg-1
Received: by mail-qt1-f198.google.com with SMTP id o4-20020ac87c44000000b003e38726ec8bso11671192qtv.23
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 13:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681418854; x=1684010854;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtJyH8SGOogFlfOnGodd9IaFOBzxhFrcUEkKoY2za9c=;
        b=IopdXFUpJn8xwHWclaLp6S0ezQAR+/NypqWh1fywoLjbeHoYH0cvpTMrRSuWoBGBt8
         7ECUi+VhcIBxpnDd2npLTL/Mx5dg/9rtIcov0huhBe75L9J86SiwEyPrqHcL632WHjGu
         SNle3w+sSe4Bf3Wf76/Yu6lIiNYUy8+xy7U20Lpp9zkxARAn5W+nu071gT35VTyjTo2w
         Q6YBtIxSldekIjOJcPs/AAiRbHp2SPRphy40y8gA337P3rE6mELCaSWyA3MJuW8ldl71
         PoTSne6dMGLHU4ktQJDher2fYOX6s5LlwTHABn50ZVbxFrvUwqqdnY1yUw55vBUD4I4J
         XUDw==
X-Gm-Message-State: AAQBX9fhMUiw8vN4My1SIPlToitHhBXs1XBmBsX1w5xiOXOkmA16F8Ta
        yWtW+I1dD5lMAozlSYrLFbTlC+IIRBNs1cbw+wSIqlA5KBivJXCkW0P8kdqbaTtD5zfqdM8oN8C
        upCqQf3YJbCL02gy3nPrg5GY=
X-Received: by 2002:a05:6214:3016:b0:5ab:56d4:dc43 with SMTP id ke22-20020a056214301600b005ab56d4dc43mr5587077qvb.7.1681418854258;
        Thu, 13 Apr 2023 13:47:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8sRNTuKwFoQtKvkf4jEyAXIx03sqtsM/4yGDcBMha7WAuFQVZmn5TalW41FaoMN1GUCoIdA==
X-Received: by 2002:a05:6214:3016:b0:5ab:56d4:dc43 with SMTP id ke22-20020a056214301600b005ab56d4dc43mr5587055qvb.7.1681418853990;
        Thu, 13 Apr 2023 13:47:33 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
        by smtp.gmail.com with ESMTPSA id dr3-20020a05621408e300b005ef44499177sm668792qvb.116.2023.04.13.13.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 13:47:33 -0700 (PDT)
Message-ID: <063c8f77c216ffac463532023009124542d54c19.camel@redhat.com>
Subject: Re: [PATCH] Input: synaptics - disable intertouch for Lenovo L440
From:   Lyude Paul <lyude@redhat.com>
To:     Jonathan Denose <jdenose@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>,
        Aman Dhoot <amandhoot12@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andrew Duggan <aduggan@synaptics.com>
Date:   Thu, 13 Apr 2023 16:47:32 -0400
In-Reply-To: <20230412175311.1.Ieb687047a5b75c7b7ee5dd258207ef5ca9a3b728@changeid>
References: <20230412175311.1.Ieb687047a5b75c7b7ee5dd258207ef5ca9a3b728@changeid>
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

This patch looks fine to me, I'm a bit curious though whether the folks at
Synaptics have any idea of some other workaround we might be able to do rat=
her
than disabling intertouch? Added Andrew Duggan to CC to ask.

If we don't get any response from them after a while, feel free to consider
this:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2023-04-12 at 17:54 -0500, Jonathan Denose wrote:
> When intertouch is enabled for the L440 a (deep)sleep/resume
> cycle causes the touchpad driver to hang which causes the
> touchpad to become unresponsive. Disable intertouch resolves
> this issue and the touchpad is fine after resume from sleep.
>=20
> Additionally, when the PNP id for the L440 is only removed
> from the topbuttonpad_pnp_ids list, a message is logged to
> enable psmouse.synaptics_intertouch, which would cause the
> sleep/resume issue again. By removing the PNP id from
> topbutton_pnp_ids and then adding it to the
> forcepad_pnp_ids array, intertouch is disabled and the
> message is not logged.
>=20
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>=20
>  drivers/input/mouse/synaptics.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synapt=
ics.c
> index fa021af8506e4..77a4f58128e84 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -150,7 +150,6 @@ static const char * const topbuttonpad_pnp_ids[] =3D =
{
>  	"LEN2001", /* Edge E431 */
>  	"LEN2002", /* Edge E531 */
>  	"LEN2003",
> -	"LEN2004", /* L440 */
>  	"LEN2005",
>  	"LEN2006", /* Edge E440/E540 */
>  	"LEN2007",
> @@ -198,6 +197,7 @@ static const char * const smbus_pnp_ids[] =3D {
>  static const char * const forcepad_pnp_ids[] =3D {
>  	"SYN300D",
>  	"SYN3014",
> +	"LEN2004", /* L440 */
>  	NULL
>  };
> =20
> @@ -1769,6 +1769,8 @@ static int synaptics_create_intertouch(struct psmou=
se *psmouse,
>  		.flags =3D I2C_CLIENT_HOST_NOTIFY,
>  	};
> =20
> +	psmouse_dbg(psmouse, "topbuttonpad is: %s\n", topbuttonpad ? "true" : "=
false");
> +
>  	return psmouse_smbus_init(psmouse, &intertouch_board,
>  				  &pdata, sizeof(pdata), true,
>  				  leave_breadcrumbs);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

