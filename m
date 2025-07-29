Return-Path: <linux-input+bounces-13717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA38B1527D
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 20:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6446D545087
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 18:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D081295DBD;
	Tue, 29 Jul 2025 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="pjqDRtV9"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCA62AE90;
	Tue, 29 Jul 2025 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753812622; cv=none; b=jUmaRqET3kDYwHrUQqtsH9nvvl39YmaUg1vjBPJ+gxrWhi02RhzYe2EaMJgCgn3/+fPlZSRrswuJJ+0Eyxs7y16i6cMY7RCmQVZdE9FQK5Q9tL8Nx9fmQWv67o9bXME+t0luc23st1n5YXhrXibi/WXRGr1pjSp2TQ5ipdhIrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753812622; c=relaxed/simple;
	bh=9R39EpjRsrM9NBjuKWJ3b9Sl/p6l42CkUZtTPH9wn10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZhnjSBdGopUCz+QixY9yzKmUbsi4eQjFo2Z+u9S1pnBeE+rmAml8qJseQT46GpHbS1RAGobnd6LuOf1uRkfhND3bUOj/RfxY3AZIQEc1xdC51cNwv6eXz/ewtwmpAFsqIa7IsXaCtatKQjQCfODyrA2cNujwrMp4ciExb/pLFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=pjqDRtV9; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0425989.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8rttL032514;
	Tue, 29 Jul 2025 12:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=7/Pov
	LSJDwcXcsFbB5zYUztmeVGVrjtuuVCZP0SNRK0=; b=pjqDRtV9szxgrG13ps9Z1
	aQjOtYZZYpc3dulaCGE7tLefRb5Xd6Jg/VIcPndsyGEObaU5HF+41tIp8eLv2g6Q
	l7boOxdn4CuyChONS841A82Opskd6Zn2X+7xHDJ5K5xnmsgHETxrY1dor0701zAy
	4YdcmXHUtK5HkIGYiPYvxk0MwPfqajncku/zWPUAB9F2+fnIokAzDGRxkA55vGnL
	YHy2vhQ6+X5Ibef8mCLubp766hZDzjm1SrNkhgjX4XyCp4K6AURh3/JtiBXOmvkd
	VdHy8/k9l2bYvnbKkrrvMz3XRoiLe5GYoohLz4tmfoByOMsWeFqSBM/SS0C1XjER
	A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 486fc9t4tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 12:59:53 -0500 (CDT)
Received: from m0425989.ppops.net (m0425989.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56THvoMS011174;
	Tue, 29 Jul 2025 12:59:52 -0500
Received: from intranet-smtp.plexus.com ([64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 486fc9t4tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 12:59:52 -0500 (CDT)
Received: from localhost (unknown [10.255.48.203])
	by intranet-smtp.plexus.com (Postfix) with ESMTP id A3C553B4F7;
	Tue, 29 Jul 2025 12:59:51 -0500 (CDT)
Date: Tue, 29 Jul 2025 12:49:51 -0500
From: Danny Kaehn <danny.kaehn@plexus.com>
To: Willie Thai <wthai@nvidia.com>
Cc: andriy.shevchenko@linux.intel.com, bartosz.golaszewski@linaro.org,
        bentiss@kernel.org, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, ethan.twardy@plexus.com, jikos@kernel.org,
        krzk+dt@kernel.org, linux-input@vger.kernel.org, robh@kernel.org,
        tingkaic@nvidia.com, rastekar@nvidia.com, dkodihalli@nvidia.com,
        mhn@nvidia.com, arundp@nvidia.com
Subject: Re: Re [PATCH v11 0/4] Firmware Support for USB-HID Devices and
 CP2112
Message-ID: <20250729174951.GB4111945@LNDCL34533.neenah.na.plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20250729145350.3538324-1-wthai@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729145350.3538324-1-wthai@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEzNyBTYWx0ZWRfX4bahBf2Pr8yR
 E8kvaNmam2d+n5iPqgVzBQQZ5DRG46k9Gls+ZnerSOzCp1EOkv3fXXkavHKKfFF6h+yIKzIew4B
 0ALCHkAVY+XlnWphCyBdPHIP7wUbdkLo8FcgUacVtwaRswFTseWPcSGoppW6YhgCj0C3zQaDQ5b
 D4FOLumU1ldGnss7P6FRBhHTSIu7hLQ2eeIMXYA23xJxssiQ6tgzwgGTqI8GjM5AGKUq/HPk1x9
 wuTd9J6XDUrATehI0+Tml2IaNOlFEpVHwaqYG8FynEom8GYn8eWkALo6k206uDfd4oX1hiVwcFn
 2J1KfRo31yo/guD+ayJL3D27RKhynZVaM77zL3c9PJR6g2BCMIB/qF9PLhQdZLdhAYjkHt5gOYi
 tMrYS2WYmuvbNxucPX1VHDnfjdmgniDndwlsBbRD59cBTpF02c+p4HId9/HRkswXrcfcByxZ
X-Proofpoint-GUID: 312z6txhGSLceQEcODaSszh7lFLENVah
X-Proofpoint-ORIG-GUID: bTmR2Lq0mhgR7NC8jNcJ94qoc4Du_vPQ
X-Authority-Analysis: v=2.4 cv=ZtntK87G c=1 sm=1 tr=0 ts=68890c19 cx=c_pps
 a=356DXeqjepxy6lyVU6o3hA==:117 a=356DXeqjepxy6lyVU6o3hA==:17
 a=p-amL0WH6BgkGnzH:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=weiHyVKbh4n8zbIAmYYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: orgsafe

On Tue, Jul 29, 2025 at 02:53:50PM +0000, Willie Thai wrote:
> Hi Danny,
> 
> I hope this message finds you well.
> Thank you for the patch set — it’s exactly what we need for the I2C-over-USB feature in our new products.
> Could you please let us know when we can expect the next version of the patch set?
> If you've paused work on it, we're happy to take over and continue from where you left off.
> 
> Thanks!

Thanks for reaching out!

Apologies, I haven't been working on this in a while, and have only been able
to intermittently return to attempt to bring it forward.

Feel free to take over and move this forward! I'm not sure what the protocol
is for that, as far as changelogs and versions and whatnot. If your product's
timeline for needing this mainlined is not urgent; however, I can prioritize
coming back to this and having a v12 submitted, likely by the end of next
week, to remove the overhead needed for you to assume ownership of the
patchset.

The last several versions of this patchset have all revolved around trying
to get this change working for ACPI as well as DeviceTree in such a way which
make the ACPI and DeviceTree interface/binding acceptable to their respective
maintainers. With this latest version, it seemed that there was not going to
be any consensus between the two firmware languages, so it seemed an entirely
different binding/interface and corresponding logic in the device driver
would be needed. This seems unfortunate, as it seemed the whole purpose of
the fwnode / device_*() functions was to unify the driver interface to the
firmware language used... but this is presumably a special case, being almost
exclusively a device composed of different generic device functions...

Let me know if you plan to take this over and if there's any
documentation/context/test procedures you would need from me; else I would be
happy to start moving this forward again now that there is someone waiting
on it.

Thanks

Danny Kaehn



