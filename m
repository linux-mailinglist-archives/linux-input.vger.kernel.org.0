Return-Path: <linux-input+bounces-2765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A34858951D4
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 13:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42266B21B04
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204806341C;
	Tue,  2 Apr 2024 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="eCdOfXw/"
X-Original-To: linux-input@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D34CB4A
	for <linux-input@vger.kernel.org>; Tue,  2 Apr 2024 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712057428; cv=none; b=CgKwfrSyrHa2sOQF+9rALbsrvjt63/MTcT6lINEVBSXYyTDHZKo14o7T5PizRmskISiEgGZ17WIMpiWvJn+Wjq0j7apfKaPLXEEooby1PZaNalRYk96C7eMr477nAhUItQU18PE10uPgU41AGYhogaGzpjITtkORb/TrxoMh4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712057428; c=relaxed/simple;
	bh=tbhpMwHqnguMJFastBE7yT0eZce5xm5zaf4fJ/sIAIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pf82eeoIo8pENbBXRtpQA4zHKh3gKG/P/HJVrGWTLNHILyokUcUY+Q+/O13JdXIeWRan2X0wHl+JO0tSopRH/MQUzkjMxS0UqDx4NIiJJdXCm/dsmOETVVOkovreNAID5qJQtuI5K59ortA07B1RbCpABa4NOnaeyJP6zM1DxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=eCdOfXw/; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
Message-ID: <cae66cad-e49a-4fa7-83cc-70aaf3346419@kl.wtf>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1712057423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7KFpUxzWT01JAo7VRwp4/VBJiCBl5ryz2CQ5IR/FwM=;
	b=eCdOfXw/NwReOTpDcpJ60uaAifJ04TbNRBRtkvWrYbZ7gVZGhNX98mcGpIeXd59U02gZLg
	zzBdA0NpQkmhg9V1Y5KTN2iZ+G3oxQOFohwYux6PyecxyFW5qy6GDC+kvpSfJqZHFYhJtB
	8R7CiMLzzgqOLpqmC3e8HKZBgVBgRpXnhAz7hjjsqBw2xIKJS5EhD+xbCXyHfy+tDJ4t2K
	pzY7E21iFXhXRBh4aya1S00Sg8pdr8dC9kMIVUSUoL1vjQlo2vKwTMt9kcNPMVa5LIDJJZ
	8EKawZ0ufMqdRHbVZVn8mMwikYF0j8Bl7Q5rIXVEhoDOiLYv3dAgVhOYLS2L/Q==
Date: Tue, 2 Apr 2024 13:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] HID: i2c-hid: Revert to await reset ACK before reading
 report descriptor
To: Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240331182440.14477-1-kl@kl.wtf>
 <391c60a4-b86f-48e4-ba64-abdcb79d71ef@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kenny Levinsen <kl@kl.wtf>
In-Reply-To: <391c60a4-b86f-48e4-ba64-abdcb79d71ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/2/24 1:06 PM, Hans de Goede wrote:
> One small remark comment below. In the hope of getting this merged
> soon I'll prepare a v3 addressing this myself (keeping you as the author).


A-OK from my side, the abort_reset label is indeed redundant now.

(The split between start and finish is also technically redundant when 
we always finish after start, but I wanted to keep the change minimal.)


