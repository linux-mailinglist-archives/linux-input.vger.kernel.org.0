Return-Path: <linux-input+bounces-15668-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44CC017EF
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 15:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A86B1A632A3
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 13:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF90632E69A;
	Thu, 23 Oct 2025 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="QLvKSlSb"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8532E68B;
	Thu, 23 Oct 2025 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226358; cv=none; b=QtFAWuhrlDGjZ+JWZtsv49rAjIpzjOcdBkOv+nvHVMlZjGRG6BlK582usaknxsy1PBykxdBrRwX63VJsb3k04tJQ80c9zNZGL1eImY20oWQ52/v28bq2/2TtQ4lyKhRGKBJs/OM4mvsKkrN2v/mzeTai5cQT08UC+2BQulNpMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226358; c=relaxed/simple;
	bh=Nfb/G2ti7GlBQkKzsnLi4YD9F7rDwDfm/IEVUFmtQYM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=olTH6Ms2RO0Wrnssy3+YOc7mNXFe2gRJz5AqjnV4riQljdt2itFZfy8GF/f5b4GxUxoMOZDOhI7gUdPMdmRBYhSXmyRBQ0lsVDRVoHmByJsn4mU7zXCzgUc9OIi/Wd5qsyeYGQ9uczPJTjEloSVfUi4fko3fDDVmFIFSyrLA19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=QLvKSlSb; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O5ZMIYN8ycDHNbzVlpkPmStoVZl4YoEN9X48sNv7hm8=; b=QLvKSlSbMqzwC84iZ1D2grsOdg
	lBxt8/sRJCZ5RLRzlYomXC6oxCTOJCNBduNL2V/Bgny96xwbomFIdO1gp26eZ8Ltnpzgj0/jN594A
	xdjQzzAanpa05Xg+w7u0COjwJgnNpcoo+LAMm9Vqs5ejbGbtNi6CKCSoZQo1/PA+bA/dkF3qnAPZb
	wsOxgm9YEPgQ7eXLMHunCBwDLrPwrSngNdB5+91+XKw5Ow0n+3qeprqkwAKYZc0/FpJONYkNHb8fB
	xLqv6WwE6ET1bXGv+nhM4Dn9diGntE1gs+R6ZGJqhX1fZnpwwtTbud2DUggrOEl4wOFTlu2bFMUlP
	Tg/JoZ7g==;
Received: from [::1] (port=39834 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1vBv52-0000000C1N5-0gAO;
	Thu, 23 Oct 2025 15:10:10 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 15:10:08 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: zhangheng <zhangheng@kylinos.cn>, 1114557@bugs.debian.org, Linux Hid
 <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org, bentiss@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Bug#1114557: [PATCH v2] HID: quirks: Add device descriptor for
 4c4a:4155
In-Reply-To: <aPhz5L-ECc8CzA0a@eldamar.lan>
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <175716941557.2355.4359402692624340645.reportbug@debianduo>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
 <aPhz5L-ECc8CzA0a@eldamar.lan>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <638f3938581848a8ca0a6dcb981dfbdd@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - sv9.manufrog.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oscillator.se
X-Get-Message-Sender-Via: sv9.manufrog.com: authenticated_id: staffan.melin@oscillator.se
X-Authenticated-Sender: sv9.manufrog.com: staffan.melin@oscillator.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Thank you Salvatore, for moving this forward.

I can add that the issue has been reported by several users on a GPD DUO 
channel on Discord -- all are on newer kernels but have different Linux 
distributions.

I can also confirm that the patch does solve my problem. Looking forward 
to some resolution of this, as it stops me from upgrading to Testing. :)

Best regards,

Staffan


On 2025-10-22 08:04, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Mon, Oct 13, 2025 at 04:32:39PM +0800, zhangheng wrote:
>> It happened to be the holiday, so communication was a bit troublesome.
>> 
>> However, after a brief discussion with the microphone manufacturer,
>> 
>> it was found that the serial number was still 20201111000001 on 
>> another
>> 
>> microphone device. So, should we add it?
> 
> As this issue still affects one of our users in Debian, is there
> anything which can be done to unblock the situation? Does that mean
> that the proposed patch is not good for the microphone device?
> 
> My understanding is that it fixes at least Staffan's case which
> regressed from 1a8953f4f774 ("HID: Add IGNORE quirk for
> SMARTLINKTECHNOLOGY").
> 
> Regards,
> Salvatore

