Return-Path: <linux-input+bounces-11444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD8A77555
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200CA188B469
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9D81E835B;
	Tue,  1 Apr 2025 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dhIiMmOg"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BA1E98F8
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493281; cv=none; b=iLllq4uOm5Tg28UuyFuBw5Ox/EiBdVhRuEXtnZahSeqU9MFJe3Lgimkb8KcP7GB3L2CxNMz9n560LZw9eubfv6RbIY5r+N5Z4nTUvh5bxWE9yxiI9SPTy8TX9I/l8R/pfhkoVIX7hBbyt2aFRDD9CzFeW4Qai0NR4qSb/fbM/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493281; c=relaxed/simple;
	bh=8lDb+tj9G9W3H50O090Rj6Werfk/2LTDDSLhunA071w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=KMe09xzZgeAnCs4/86KXEFFGYOadYyOZYoZ3IREiBv2FlQmyiyy/0y754nSiMYhZ82IDw8r6pGLiMEuq/iemTEUcRph4oUyx7neo18refov9/W8vrMl2MzDcBo52VGwyzDmsp4C105NT4QPdN2pdcOFGfXOfsydoNVo1eHh3iBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dhIiMmOg; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250401074111epoutp01249ec70763d4159d9c4560edf07d7758~yIeSgJHUl0806908069epoutp01F
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:41:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250401074111epoutp01249ec70763d4159d9c4560edf07d7758~yIeSgJHUl0806908069epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493271;
	bh=oBb0BNuAwn97pBFWWNNhY+k0ByaCS6BtqFypjpWj3LI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dhIiMmOgpIimDhFQjIeaXfKI4XnXCGeH5asBRjjeL+kaH6xWieb2yrtONElo9fn7L
	 WYhuduJxkBak7xdAPtw4s2UGnmXjiX6lozL7RhRtW3MR331KBPJKTEWilssSP+pSYp
	 TW3P23y3rH3WYHIVTGmlMKSmD+QjC0xMpQFgGS9M=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250401074110epcas2p42906b946a2f87cf851b94e972247d74d~yIeRviT5m0310803108epcas2p4_;
	Tue,  1 Apr 2025 07:41:10 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZRg0j6yPfz6B9mH; Tue,  1 Apr
	2025 07:41:09 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.B6.10159.5989BE76; Tue,  1 Apr 2025 16:41:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250401074109epcas2p213c1e698e333e78e0f89a5f6380e0453~yIeQaWFJ21964319643epcas2p2m;
	Tue,  1 Apr 2025 07:41:09 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250401074109epsmtrp244d82242992aaca5f40aaa0affd2524e~yIeQYvBma1489914899epsmtrp2C;
	Tue,  1 Apr 2025 07:41:09 +0000 (GMT)
X-AuditID: b6c32a46-9fefd700000027af-e4-67eb9895f11c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7B.C2.08805.5989BE76; Tue,  1 Apr 2025 16:41:09 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074109epsmtip2a820e9c556cf528e6cb2713bb3dff038~yIeQJ7yIZ0868108681epsmtip25;
	Tue,  1 Apr 2025 07:41:09 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:50:21 +0900
From: Jung Daehwan <dh10.jung@samsung.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, Puma Hsu <pumahsu@google.com>,
	srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, Mathias Nyman
	<mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
Message-ID: <20250401075021.GB98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2025040109-dove-declared-9466@gregkh>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta1BTRxTH3dy8QONcg8CWOsKEfhBoYsIjWVqgOljnjm0RhbbWL/QCl5CB
	PCaPCrZDEQQBW4ER2hKVIg9xGC1MBiMiDwkvUYSCggqFKSMNBqQoFKR1gCZcbP3223PO//zP
	2Z3lYnwjx4OrUOkprYpMFrCdmeZ2HyQs/mlGLl7ME6PiiUk2utLcx0CTt04B9HNHHwu1lz8F
	KLOilo1sxnE2WnqQw0CFrfc46GJ2JRM9nl9iofuN59nogrUIQ+WXsjCUaSpioZnnGUyU25jP
	Qv+sWRmo5Ko3Mt08w0JrTQ0clN3VxUI1Zbc4qO7lVbAHEjeMYxyizGQgKppsDMJUk8smfhtu
	YhOlPYeI1gtXOETFmbMsomX2EpsobEojauuHmER96wIgFkw7I3lHk0ISKTKe0npRqjh1vEIl
	DxV8FBUTHhMkFUuEkmAkE3ipSCUVKtj3caRwvyLZvr/A6ysy2WAPRZI6nWB3WIhWbdBTXolq
	nT5UQGnikzUyjUhHKnUGlVykovTvScRi/yB74ZdJiQMzq0Bz1y3FbCkA6aBqWx5w4kI8EOYX
	53DygDOXjzcA+P1lK3Ak+Pg8gNbaCDqxBGDfxCr7tSLrr8oNRTOA5+uWAH2YBNC8UIU5qpj4
	O7DE0sVyMBv3hePLt9fj2/Fd0NY5wnQIMPwVEz5oNq/7ueBJsLPcyHAwD/eDnaUvmDRvgz0l
	k+vshAfA7rw1+xhcrqvdYLrtW0cfiF93goO2hwx6vH3w9/onTJpd4HR3PYdmD7jwZ/PGCjo4
	MmXFaPFJAC9Pn8ToRAA0Wk8BhwGGJ8Kn58IcCHFv2DGy3hLDt8Kc9hUOHebBnGw+LfSGP94v
	YNH8Fmyb6dtoSMAf8oc37mcFg+Vlo4wC4Gl8YzPj/2Y0+sDaxt3GdTNPmHntHEaH34bVq9w3
	KsoAuwa4URqdUk7p/DX+/z17nFppAuufxHd/AyiafS6yAAYXWADkYoLtvCOLNjmfF0+mHqe0
	6hitIZnSWUCQ/cUKMQ/XOLX9l6n0MZLAYHGgVCqR+QeJZQJ3nuXFH3I+Lif1VBJFaSjtax2D
	6+SRzvAxCIc2n846SqXIy1WiwccxadEHhREnXtna3PR1izsnjkWRsQOifpjpXnZkTPnh4WvV
	ylHFvdnMyWVx5Cb/7KATF3P656rNfn8PUc79ae8/fGncOzbfn7Hljufo3mP+SHrodnDi58ti
	2FIz3ZnxzNzToXh37uawivfr6SfUJ+6u/BCOT+9BoXQhVR75zQ7fM89+udGV4FGrjMCddyTE
	5gbMkmNbojsivRYzBuXxzvxd03s+S80+G5jwhbnlOvbpI5c7sWHh2kdfW2wH/A4fj64sWYtX
	+Mo23RUVDQBheJE1aUrRm2rcXFXQPVUgLV2RTDRyUuZ6P0DpsvGtKd+lzcAoAVOXSEp8Ma2O
	/Be0FYU5rQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUzMcRzHfX9P9+vs+LmSb4U4z9ecQ7t9jYwxfmuzsf7QsqVTv056kLsi
	DHG5uClMSZdOT57OWe1WSo7T9UCNlvKUOMqtSWo9SR5yuo7pv9c+7/f39fn88aVxYS/hTUfF
	JXDKOHmMiOITd6pFvkszL3UrpOlpU1Bmu51CxvuNGLI/TAXoSk0jiaoLPgGkLiymUJfORqHh
	56cwdN7ylIfyNUUEah0YJlFL5WUK5XZm4Kjg2kkcqU0ZJOruO0Gg05VnSfTD0Ymh7NvzkOle
	Ookc5goe0tTVkciQ95CHSr7dBusge1f3jsfmmRLZQnMXxpoMpyn27Uszxerrt7GWXCOPLUy/
	QLIPeq5R7HnzUba49AXBlloGATtomr1VEMJfE8HFRO3nlMvWhvF3/xxpx+N73JPO3uqhksHH
	KVrgRkPGH54cKuJpAZ8WMvcArO19QboCL3g19zXPxe7wfUoN6Sp1AJjSlDxeIpj5MNtaN84U
	I4a2kce4kz2YxbCr9g3hZJwZJaCmys3J7kw0rC3QYU4WMH6wVt9PuKQOHOYXPeW5gmmwPtv+
	9/Ei+EvfPCalx9gHXv9Nu8a+UF2WM77LjVkJH2kdlLMyfeyez1XHzgGhboJIN0Gk+y/STRDl
	AcIAvLh4VawiVrU8fkUcd0CikseqEuMUkvC9sSYw/iXE4gpgNvRJrACjgRVAGhd5CIK/dimE
	ggj5wUOccu9OZWIMp7ICH5oQzRAMd6dFCBmFPIGL5rh4TvkvxWg372Qs17gwaEkqFbplmVaL
	H5YhWVlZkvfml5X9e46nGYe8gv0DjyGfhvJVlhDiptAaOStw/0Zb6S+/AJnMPmoL1bQ8EvA9
	yRt9iTlZc1sGspNSjcItWy3mt9PDeq1XOjo2tnpZrG1adUlOgm9mzbsFUzlZaNQufVjAxYah
	Zxk1i6UepHdbtAh/s0TUvWGHcs7qUwe+l3fewiL3LbiTMtBs57eyMwNfHXnSLhh0HCR0M1fb
	cvCgM88+TtYQHxRSfcingK9ZCgsJP0ubR4vzPH8YPpSLtSkjUknQJJ/w7Y2qtpiK8H5108h7
	//xzXyyDa34SfsHrvzXMrpDUp01+FbkJLxERqt3y5WJcqZL/ATRBC4aBAwAA
X-CMS-MailID: 20250401074109epcas2p213c1e698e333e78e0f89a5f6380e0453
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a8e4_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250327161254epcas2p35ea7c80bdcefaefc645c061531dd6833
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-2-quic_wcheng@quicinc.com>
	<CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
	<2025032734-reward-fantasize-dc16@gregkh>
	<CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
	<CGME20250327161254epcas2p35ea7c80bdcefaefc645c061531dd6833@epcas2p3.samsung.com>
	<87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>
	<20250401022336.GA98772@ubuntu> <2025040109-dove-declared-9466@gregkh>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a8e4_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Apr 01, 2025 at 07:55:13AM +0100, Greg KH wrote:
> On Tue, Apr 01, 2025 at 11:23:36AM +0900, Jung Daehwan wrote:
> > On Thu, Mar 27, 2025 at 09:12:12AM -0700, Wesley Cheng wrote:
> > > 
> > > 
> > > On 3/27/2025 3:14 AM, Puma Hsu wrote:
> > > > On Thu, Mar 27, 2025 at 3:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >>
> > > >> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > > >>> Hi,
> > > >>>
> > > >>> We have implemented and verified the USB audio offloading feature with
> > > >>> the xhci sideband driver on our Google Pixel products. We would
> > > >>> appreciate it if this solution can be accepted. Thank you all for the
> > > >>> work!
> > > >>>
> > > >>
> > > >> Great, can you properly send a "Tested-by:" line for this against the
> > > >> 00/XX email so that it will be properly saved?
> > > >>
> > > > 
> > > > We(Google Pixel) only use the xhci sideband related changes and two
> > > > changes in the sound card driver. For the details, what we actually
> > > > tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> > > > Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> > > > send the "Tested-by:" line to the 8 changes above? (I added
> > > > "Tested-by" line for this [01/31] first.)
> > > > 
> > > >> Also, I think a new version of the series is coming, can you test that
> > > >> to verify it works properly?  We have to wait until after -rc1 is out
> > > >> anyway.
> > > >>
> > > > 
> > > > I think this v36 is the last version of the series as I discussed with
> > > > QCOM Wesley. And for sure I will test it if they do have a new
> > > > version.
> > > > 
> > > 
> > > Hi Puma,
> > > 
> > > I'm discussing with Stephan on the QC specific stuff, so the common changes
> > > won't change on v37.  Please provide your tested-by tags for each commit,
> > > so I can carry them accordingly on the next submission.  If I do end up
> > > making changes to any of the common patches, I will remove your tested by
> > > tag, which means you might have to test it again.
> > > 
> > > Thanks
> > > Wesley Cheng
> > > 
> > > 
> > > 
> > 
> > Hi Wesley,
> > 
> > Thanks for your effort to upstream usb audio offload.
> > I've also used your patchset like Puma.
> > ([01], [02], [03], [04], [05], [06], [08], and [12])
> > 
> > It works well on Exynos. Please let me know if you need also
> > "Tested-by:" on our side.
> 
> Yes please.
>

Tested-by: Daehwan Jung <dh10.jung@samsung.com>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a8e4_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a8e4_--

