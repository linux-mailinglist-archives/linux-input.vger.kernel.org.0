Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AEE113D09
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 09:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfLEIae (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 03:30:34 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52166 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725974AbfLEIae (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Dec 2019 03:30:34 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB58SLJ9020757;
        Thu, 5 Dec 2019 09:30:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=myUc//5L9CCr4hqe++W2Bj42igL3v+3NhNiVfYlVMt4=;
 b=TWhz6eI+6eXeuNFUTmKhAaWfY+k7Rr2ZRZ9vH0+8iogBEc5hjmxC1+bw/y8iX6+HMvrH
 LH78t37J7Ejx3Sx1jqmzy2Pxjc2QTZpRoae6xOjyFrJktFrR2byk4M3K4aiLDIPxjxxW
 BobvBEUnah6f4NmR6cess1ecLNBdtMCjIUEWiHG7wTCAncf39aLiYHyXLTpZgUs9BdXm
 FCzhFJQgVYKf2+tJk8PHtWKUf2G0SxFNsiP55UifP5qd9LR7rna99WJdoIHhrn/LMRAk
 DqkMQnjyEhqwsq4YTHgxH4hb83qaPRKjRty9eqwBvuBRP3KVBopnMHeNBtkAlsoXeH9A jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wkg6ksdau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Dec 2019 09:30:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06D52100038;
        Thu,  5 Dec 2019 09:30:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBD092AF6A0;
        Thu,  5 Dec 2019 09:30:26 +0100 (CET)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Dec
 2019 09:30:26 +0100
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Thu, 5 Dec 2019 09:30:26 +0100
From:   Yannick FERTRE <yannick.fertre@st.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Philippe CORNU <philippe.cornu@st.com>,
        Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        Bastien Nocera <hadess@hadess.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: goodix - support gt9147 touchpanel
Thread-Topic: [PATCH] Input: goodix - support gt9147 touchpanel
Thread-Index: AQHVpQ11LDOqyllChkeeHL9myer67qekjkoAgAayLbA=
Date:   Thu, 5 Dec 2019 08:30:26 +0000
Message-ID: <bd51e553feb74f6fb3a7115463d52e66@SFHDAG6NODE1.st.com>
References: <1574850526-13518-1-git-send-email-yannick.fertre@st.com>
 <20191201030818.GM248138@dtor-ws>
In-Reply-To: <20191201030818.GM248138@dtor-ws>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_01:2019-12-04,2019-12-05 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,
Dmitry,
I forgot to modify the binding to declare the new compatible "gt9147".
Rob,
can I modify the binding without converting it first to yaml?

Best regards

Yannick Fertr=E9

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: dimanche 1 d=E9cembre 2019 04:08
To: Yannick FERTRE <yannick.fertre@st.com>; Rob Herring <robh+dt@kernel.org=
>
Cc: Philippe CORNU <philippe.cornu@st.com>; Benjamin GAIGNARD <benjamin.gai=
gnard@st.com>; Bastien Nocera <hadess@hadess.net>; linux-input@vger.kernel.=
org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - support gt9147 touchpanel

On Wed, Nov 27, 2019 at 11:28:46AM +0100, Yannick Fertre wrote:
> From: Yannick Fertr=E9 <yannick.fertre@st.com>
>=20
> Add support for it by adding compatible and supported chip data=20
> (default settings used).
> The chip data on GT9147 is similar to GT912, like
> - config data register has 0x8047 address
> - config data register max len is 240
> - config data checksum has 8-bit

If it is compatible with gt912 then the driver does not need another compat=
ible in the code I think. Rob will tell more.

>=20
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  drivers/input/touchscreen/goodix.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/input/touchscreen/goodix.c=20
> b/drivers/input/touchscreen/goodix.c
> index fb43aa7..b470773 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1045,6 +1045,7 @@ static const struct of_device_id goodix_of_match[] =
=3D {
>  	{ .compatible =3D "goodix,gt9271" },
>  	{ .compatible =3D "goodix,gt928" },
>  	{ .compatible =3D "goodix,gt967" },
> +	{ .compatible =3D "goodix,gt9147",},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, goodix_of_match);
> --
> 2.7.4
>=20

--=20
Dmitry
