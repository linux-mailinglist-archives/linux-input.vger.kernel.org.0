Return-Path: <linux-input+bounces-4232-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F602900BF0
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 20:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0712876D1
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 18:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AD513F440;
	Fri,  7 Jun 2024 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="e1WwCWtM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F7F7347D;
	Fri,  7 Jun 2024 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717785603; cv=none; b=a+X5qifsZrBItGcupFHlx0b47dMg/UE74x7ohv6/ZR2eKlMKb0OYCVyFB8Lle/ZiMq6yBHHEbOn9PpxZsZeGAl0nDDfmW/dxp7h97TWyBtH2M4Lxk5ECjoedcGCSHC5oX95EoH6e5VP5sujYphBTNKH7wmWWhFUG+PpEEA2bMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717785603; c=relaxed/simple;
	bh=XrnAZQPy5MleIUFVrbjajyCw8B0veQFWvMp+ZkNsN/0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNiO0hRRMNYTDOlZwHFVUQE0EKu8erBcasaQxbd0X1sWUG+YOSQBphAPzgEjTPFMIpLeIY8B4QY0FaUYozdcBWxife6D7Y2JIrbL0HtGIlOV5bJ1GB1LiPRt+a477Z9SyvgHXqmTDtuNJL+/zWs4uUPqItUOTm0hpcujyXPcbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=e1WwCWtM; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HbHAV024025;
	Fri, 7 Jun 2024 18:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=f9NZN
	JGk65djRz0rGyG5q4sFjM+L20Q+9R0VIHl7O7o=; b=e1WwCWtMu3GRh/SPc/J8h
	tUe5Fc25Q98iVPuWCiKDPVKkrFd5WDyigtqRydTU+EtsAgAdtVkd8K3ikcbglpMI
	Oy8ZFARdERPHy7op3T8e2MOrjdyqKt9C8BRCQ6yHHjGJWklj+O7cRI94PHZAf2nk
	PXaad+mpkdJjosUMPWCVkAlLyTY2h8A6YiX/g20+e2ZnWKPIKmxqIZY79rI/urhQ
	M0aei3V09MUCU3MhW7Qvt/Sxk3MwOGhDNQT+YPDlDnQK3Yzjg9U16RJiGLld8svh
	wPaX6RY6T/fv6ROlMtZb8Y8hy6ws6NUJ46M+2MfR17exCWi5cvpcJKwoJvDaiCwh
	Q==
Received: from gcc-mail-mx-003.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3ykv8ha1gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 07 Jun 2024 18:39:53 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-003.na.plexus.com (10.255.51.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 7 Jun 2024 18:39:52 +0000
Received: from localhost (10.255.48.203) by gcc-mail-mx-004.Na.Plexus.com
 (10.255.51.224) with Microsoft SMTP Server id 15.1.2507.37 via Frontend
 Transport; Fri, 7 Jun 2024 18:39:52 +0000
Date: Fri, 7 Jun 2024 13:38:36 -0500
From: Danny Kaehn <danny.kaehn@plexus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20240607183836.GA965006@LNDCL34533.neenah.na.plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
 <20240606151859.GA3605325-robh@kernel.org>
 <20240606162438.GA77976@LNDCL34533.neenah.na.plexus.com>
 <ZmISrFrUVadRS1Do@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmISrFrUVadRS1Do@smile.fi.intel.com>
X-Proofpoint-GUID: IKZCxLKVn9kZKbAyueu-J3-gCvVn1dh9
X-Proofpoint-ORIG-GUID: IKZCxLKVn9kZKbAyueu-J3-gCvVn1dh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_11,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxlogscore=797 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070136

On Thu, Jun 06, 2024 at 10:49:00PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 06, 2024 at 11:24:38AM -0500, Danny Kaehn wrote:
> > On Thu, Jun 06, 2024 at 09:18:59AM -0600, Rob Herring wrote:
> > > On Wed, Jun 05, 2024 at 06:12:44PM -0500, Danny Kaehn wrote:
> 
> ...
> 
> > > > +  i2c:
> > > > +    description: The SMBus/I2C controller node for the CP2112
> > > > +    $ref: /schemas/i2c/i2c-controller.yaml#
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +    properties:
> > > > +      sda-gpios:
> > > > +        maxItems: 1
> > > > +
> > > > +      scl-gpios:
> > > > +        maxItems: 1
> > > 
> > > These are because I2C can be on any of the pins? It's a bit odd if they 
> > > aren't used as gpios. Probably should be pinmux, but that's overkill for 
> > > 2 pins.
> > >
> > 
> > I'm beginning to realize now that this may be a bit non-standard, but it
> > did solve a stuck bus issue under some conditions.
> > 
> > The CP2112's I2C controller is self-contained and can only be on the
> > specific pins it is attached to (no pinmux, etc..).
> > 
> > In this case, these properties are ment to specify additional gpio pins
> > which are connected to the SCL and SDA lines (this then also assumes those
> > are configured to be open drain / inputs to not interfere with the bus
> > during normal operation). This was inspired by what is done ini2c-imx.yaml,
> > but I realize this is a bit different due to using external pins rather
> > than pinmuxing to the GPIOs.
> > 
> > How I used this was to actually connect some of the CP2112's own GPIO pins
> > to the SDA and SCL lines to be able to use those pins to recover the
> > bus. This was able to solve a stuck bus under some real-world cases with
> > the v2 of the CP2112 containing an errata which caused this
> > semi-frequently.
> 
> Aren't they just for I²C recovery?

Not sure if you were looking for my reply here, but yes. I guess the
only "non-standard" thing really here is the idea of using
external/separate GPIO pins to do the recovery, rather than pinmuxing the
I2C pins to GPIO which most current implementations seem to do.

Thanks,

Danny Kaehn

