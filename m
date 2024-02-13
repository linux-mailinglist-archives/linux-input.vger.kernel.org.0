Return-Path: <linux-input+bounces-1888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93C8538A6
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 18:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26EB2281CE8
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 17:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97DDA93C;
	Tue, 13 Feb 2024 17:38:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAFC5FF17
	for <linux-input@vger.kernel.org>; Tue, 13 Feb 2024 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707845930; cv=none; b=SK3k75v+ygprDNIQ7G7pnsESD6iqYjcS2uG/uNZL0xPhRnNW3DIaObDmtn7r0W3cGJiQx4usX1022RjTMiPQFtSmKt5UGNR5AxqAulWtMijnveHEbAtULZio2sFwjD9fkiEBifQSUH58/z0TpCrGm7CqGP2nec5axndt6KEyDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707845930; c=relaxed/simple;
	bh=f6kydnRrRSx8Dm+NOEYJGD0T0LGNuLZAUunAOJIBmqY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HPBI/kyATSdYppBfHZ2UWoJdh0NNlD4fqLge1XqiIKP7hj5nteiFUs8WsBwe10pVOzvnlEvGEPjadTlwoNctcTHypp7+NDobEYUVoGao5cT2KmRX6NOFwwbpL/dLcfXw7RO3I4jLuqpsbe9kWBG4kD2JDyThGJyBmi8imKRkUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basealt.ru; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=194.107.17.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basealt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: by air.basealt.ru (Postfix, from userid 490)
	id 1A7BF2F20241; Tue, 13 Feb 2024 17:38:47 +0000 (UTC)
X-Spam-Level: 
Received: from [10.88.144.12] (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 5A1DB2F20240
	for <linux-input@vger.kernel.org>; Tue, 13 Feb 2024 17:38:45 +0000 (UTC)
Message-ID: <ac98e46a-1b2d-b9df-53b7-edecace27b2f@basealt.ru>
Date: Tue, 13 Feb 2024 20:38:45 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: linux-input@vger.kernel.org
Content-Language: en-US
From: Ajrat Makhmutov <ajratma@basealt.ru>
Subject: Different uhid_event size on different archs.
X-Priority: 2 (High)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

https://github.com/torvalds/linux/blob/1f719a2f3fa67665578c759ac34fd3d3690c1a20/include/uapi/linux/uhid.h#L180

Union in struct uhid_event has no __attribute__((__packed__)), so 
alignment from 4372 to 4376 bytes is performed on a 64-bit system. On a 
32-bit system, the size remains 4372. Is this a bug?_
_


