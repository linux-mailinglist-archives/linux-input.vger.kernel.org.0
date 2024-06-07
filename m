Return-Path: <linux-input+bounces-4231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22584900B23
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0BC3285309
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C68F199EBC;
	Fri,  7 Jun 2024 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="X7jjyOTQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B716D338;
	Fri,  7 Jun 2024 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717780909; cv=none; b=oRjrKJ8vxEPjWbKmQj0dDNf369S0PjWRHHZhtZRcAmPGnsCx35IeUTzqtLU/l+3rBaVv2OKjxnutg0bBNMpe6sVKPDZXXwmDS6t+SXUdE9T2rB2puQW+qsGec46cAEorjUKON9J7o0kIT2B4SxssJRloaEWm7JRvjNBl518x1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717780909; c=relaxed/simple;
	bh=jAuIltlDaAyff/I80GVbXuPMScpACIOTN4beZe3XSAQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn+pW5g+7GrIxG463zzhC5d6BNZkirLTGplX45tfzZBrVsEW0mrwHP8vrO7GD9VrcZiQLx0Bo0B9KmcX13+P4j0dH3zV6pdL3C5eGPNiiS386XNH1s1bx9rHiBXvhbpSqiGu8+86/qaV4qwCTgEgF0VAW73pT51xhYTXkENK1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=X7jjyOTQ; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457EGEaD031426;
	Fri, 7 Jun 2024 17:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps1; bh=6BzGGL+iFLYc28uEGbjmQdv4ZnFjt
	aU0kqTP2qX7EIo=; b=X7jjyOTQt/91AGSD1KCxFSoisPhoT4CDsQRG0SF6+oDls
	SNBju5gTeXxASYrnYx0a+ZjK9OeufpOiJQT4JvNInvhSQRrG/J2MgOJkD0uN0h9L
	SxzJBwU7ZqTllVsukyPKZdBzRA/7Xdyer5Ak55SBnJO8a3R7H07UZ3AQ9OxYV392
	/MsgPRW5oNC8RsWxz3L9G6EzUsoGTq66FVPap32u9l3Dv5yahIF1ApU9z451F0AO
	uxWsvb1s17Wk5FqJ2Muu6iJFo640uHoOlVtdTimIr9h2QIrVNFqubFT2Fa08q+pq
	CQfehIUcqbDZ8R/T64QH3vPsU2U4wBxmiPQ2YRFlQ==
Received: from gcc-mail-mx-003.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3ykv8h9u83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 07 Jun 2024 17:21:29 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-003.na.plexus.com (10.255.51.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 7 Jun 2024 17:21:28 +0000
Received: from localhost (10.255.48.203) by gcc-mail-mx-004.Na.Plexus.com
 (10.255.51.224) with Microsoft SMTP Server id 15.1.2507.37 via Frontend
 Transport; Fri, 7 Jun 2024 17:21:28 +0000
Date: Fri, 7 Jun 2024 12:20:12 -0500
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
Subject: Re: [PATCH v11 0/4] Firmware Support for USB-HID Devices and CP2112
Message-ID: <20240607172012.GA874591@LNDCL34533.neenah.na.plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <ZmD38oynzhjH2628@smile.fi.intel.com>
 <20240606155453.GA54873@LNDCL34533.neenah.na.plexus.com>
 <ZmISaEIGlxZVK_jf@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZmISaEIGlxZVK_jf@smile.fi.intel.com>
X-Proofpoint-GUID: vnU7YcwXu3WvV6ebehQDIrsi8b1W8tT0
X-Proofpoint-ORIG-GUID: vnU7YcwXu3WvV6ebehQDIrsi8b1W8tT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_10,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070128

On Thu, Jun 06, 2024 at 10:47:52PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 06, 2024 at 10:54:53AM -0500, Danny Kaehn wrote:
> > On Thu, Jun 06, 2024 at 02:42:42AM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 05, 2024 at 06:12:43PM -0500, Danny Kaehn wrote:
> 
> ...
> 
> > > > Changes in v11:
> > > > - Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
> > > >     from Rob H.
> > > 
> > > Hmm... I don't know much about DT, but how is this supposed to work in ACPI?
> > > I mean if we want to refer to the GPIO in GpioIo() or GpioInt() resources,
> > > what should we put there as ACPI path?
> > 
> > What I tested was essentially taking what Benjamin had done in [1], just
> > removing the "GPIO" device and combining it with the parent device (the
> > CP2112 itself). So for the example below, I believe the path would be
> > "\_SB_.PCI0.SE9_.RHUB.CP2_". If I get the chance (and can figure out how
> > to do it using ACPI) I'll try to add a "gpio-keys" or something to the
> > system using this path and make sure that works.
> 
> This is counter intuitive and doesn't follow other (ACPI) devices with GPIO.
> So whatever you do for DT I don't care much, but let's not remove subnode
> for ACPI case.
>

Fair enough, will let this sit for a moment to see if there are comments
from Rob/Krzysztof, and otherwise will rework the driver to support the
different models for DT and ACPI. For what it's worth, combining the
GPIO chip and CP2112 nodes in DT also seems unintuitive to me, and it
seems there's other bindings for multi-function devices which define a
separate child "gpio" node, so I'm not sure why it's not desired here.

Thanks,

Danny Kaehn


