Return-Path: <linux-input+bounces-5471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C961E94D501
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 18:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07FDE1C22826
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 16:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572C63770D;
	Fri,  9 Aug 2024 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="BIIot5S4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6183219F;
	Fri,  9 Aug 2024 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723222201; cv=none; b=MVGXrEOpUe7EU/PawyLy6/oCcFX4BqStCKKsD9KYQg0DeZySARy9dMCjY6Tm12ieDyBMlNPS47EEmzHM19q6pzBH/8LoNSVl40O2m9rLTiCkv+wH1HsfFKQTbjiXINVaoPfW9IXpD1oYTmLpj53AbxCE7j0X0kIlsLqUoG1t7Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723222201; c=relaxed/simple;
	bh=OEhDCKC7XxQz/etWSHrnTxto6i7ZdGAWvaaLyKVTT8k=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kutVY5K/peL/axT6Y9530hds+A3gdIoeQ/+4cpAwSPs9W3ZINsKg2b/GZPZt8lpc/bhwe/2BkW8aA3PXXKy8epAQq302wAGmch9IyLyFaHSoFaVEtVnha/IpJpZFO15lcr3UrlxdhoRqGZALXAoddCreOAUgHiVWkSw/WR4LFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=BIIot5S4; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.20] (p5de45112.dip0.t-ipconnect.de [93.228.81.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E6D602FC0057;
	Fri,  9 Aug 2024 18:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1723222195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEhDCKC7XxQz/etWSHrnTxto6i7ZdGAWvaaLyKVTT8k=;
	b=BIIot5S4sFlgymj/D6Rm0adBpNg2knt9g5cxNuRy0cDbPUUhzakxwT0kdUfrVBVtnRQ8ge
	HdolAVFk2IqB3TRJ3QpKR+aEWSmhPwjLS9DUy0KN3FognjtbZC55q+JMwKGVGeRlKJ6PAV
	+qabN6eEAGSC/PTkAc6oYqge8AnvgvQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <a168a43a-b148-4eed-9d8e-b310a0a0c011@tuxedocomputers.com>
Date: Fri, 9 Aug 2024 18:49:54 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wse@tuxedocomputers.com
Cc: dmitry.torokhov@gmail.com, hdegoede@redhat.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <dd140606-6786-4c4f-9e39-448a4df72bb5@tuxedocomputers.com>
Subject: Re: [PATCH v4 1/2] i8042: Add forcenorestore quirk to leave
 controller untouched even on s3
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <dd140606-6786-4c4f-9e39-448a4df72bb5@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

gentle bump to this patch, still applies to v6.11-rc2

Kind regards,

Werner


