Return-Path: <linux-input+bounces-4172-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA708FF167
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 17:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF421C240AD
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 15:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46E0197A95;
	Thu,  6 Jun 2024 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="OSmd6crX"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F260D197A61;
	Thu,  6 Jun 2024 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689393; cv=none; b=RBSfUZ/iQxvPQ0PQsM7rNGWFKrPVLfqU/fosTBsOh1NYFFZxfm4rmQ/AcX4jcULc0ccUhnRbsmlq1IVt7KS+1DkX+dgJTGTdFxjHoZMCdkA8BspXmJlkdWHWLFk1L6mP8pJgtTAadLcYhKaA0zUd/Be8YRNR6b2cFlr4DOb1W7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689393; c=relaxed/simple;
	bh=g67SaAr4GLAhNd5cFQndSHSoDutfTMw6LmGVQ9ir4qU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUYnqr5mKnzwH4bJx18ffXO3mVF5RLLS06PRudj8cldeQ1n1CkPtUqsi3p4oSMgWiQXshnwMU/3SLsPXqc7lJIa2V0BmCwo3wzvxse52WXIhc7XJEtegh4Nk6SGWj5WwC2LvpxWcHUIpeLXPgeF03br8UdPcV+cZ9bS71xyk8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=OSmd6crX; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456CCjN7015214;
	Thu, 6 Jun 2024 10:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps1; bh=6qQ1EIAiPRq5sp1rD2NV+P6hCiWha
	M4P+juKIfxaTaw=; b=OSmd6crXZdzBIJnKubmkWlnkbeMZ87ciekhFpcCvwLDlS
	0MWNTBxUBGp6LvC43Timp1+XWfX83/ivMii/5uBsZDv0nq4MqM9Na2xfeM1uJr/v
	Uibi/7gQTqC/kF+zHyFquRdqveXg53Clo9ae2mtv9UqfhganfiLMyhjD6vQlFR5h
	YppG8M2cQ19Y24YLv7OKDU3sGWBkjkjDXz5xZuKltcJ3harmRD2fPlhp6ACC6MN0
	62qIr1tWEoSXhTWvG4rWY9QPFGqledoJn3pwYm+6jDDrMKGGaGvmerBdWaY/3pmy
	hx5DqC4tVlqNGnfRpfksQRmw5hGZU2IL0+r1RL65A==
Received: from dcc-mail-mx-004.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3ykcwv8q4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 06 Jun 2024 10:56:25 -0500 (CDT)
Received: from Dcc-mail-mx-002.na.plexus.com (10.249.48.16) by
 dcc-mail-mx-004.na.plexus.com (10.249.48.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 6 Jun 2024 15:56:05 +0000
Received: from localhost (10.255.48.203) by Dcc-mail-mx-002.na.plexus.com
 (10.249.48.16) with Microsoft SMTP Server id 15.1.2507.37 via Frontend
 Transport; Thu, 6 Jun 2024 15:56:05 +0000
Date: Thu, 6 Jun 2024 10:54:53 -0500
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
Message-ID: <20240606155453.GA54873@LNDCL34533.neenah.na.plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <ZmD38oynzhjH2628@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZmD38oynzhjH2628@smile.fi.intel.com>
X-Proofpoint-GUID: 0iEi2T1ftyjBrY7csHqT5xmMI7-yTkk9
X-Proofpoint-ORIG-GUID: 0iEi2T1ftyjBrY7csHqT5xmMI7-yTkk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=983 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060116

On Thu, Jun 06, 2024 at 02:42:42AM +0300, Andy Shevchenko wrote:
> On Wed, Jun 05, 2024 at 06:12:43PM -0500, Danny Kaehn wrote:
> > This patchset allows USB-HID devices to have Firmware bindings through sharing
> > the USB fwnode with the HID driver, and adds such a binding and driver
> > implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> > USB-HID change). This change allows a CP2112 permanently attached in hardware to
> > be described in DT and ACPI and interoperate with other drivers.
> 
> ...
> 
> > Changes in v11:
> > - Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
> >     from Rob H.
> 
> Hmm... I don't know much about DT, but how is this supposed to work in ACPI?
> I mean if we want to refer to the GPIO in GpioIo() or GpioInt() resources,
> what should we put there as ACPI path?

What I tested was essentially taking what Benjamin had done in [1], just
removing the "GPIO" device and combining it with the parent device (the
CP2112 itself). So for the example below, I believe the path would be
"\_SB_.PCI0.SE9_.RHUB.CP2_". If I get the chance (and can figure out how
to do it using ACPI) I'll try to add a "gpio-keys" or something to the
system using this path and make sure that works.

[1]: https://patchwork.kernel.org/project/linux-input/patch/20230227140758.1575-4-kaehndan@gmail.com/#25242036

Thanks,

Danny Kaehn

---

Full example within context:

Device (SE9)
{
    Name (_ADR, 0x001D0001)  // _ADR: Address
    Device (RHUB)
    {
        Name (_ADR, Zero)
        Device (CP2) // the USB-hid & CP2112 shared node
        {
            Name (_ADR, One)
            Name (_STA, 0x0F)
            
            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "gpio-hog", 1 },
                    Package () { "gpios", Package () { 4, 0 } },
                    Package () { "output-high", 1 },
                    Package () { "line-name", "gpio4-pullup" },
                },
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "gpio-line-names", Package () {
                                "",
                                "",
                                "irq-rmi4",
                                "",
                                "power", // set to 1 with gpio-hog above
                                "",
                                "",
                                "",
                                ""}},
                }
            })
            Device (I2C0)
            {
                Name (_ADR, Zero)
                Name (_STA, 0x0F)
            }
        }
    }
}

> 
> > - Edit hid-cp2112.c to match for ACPI index and fall back to matching by
> >     name (instead of the other way around)
> > - Separate CP2112 I2C bus speed configuration into a separate patch
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

