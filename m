Return-Path: <linux-input+bounces-15739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B65C0ED57
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 16:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271483BDE31
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B832C235F;
	Mon, 27 Oct 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qhGQecJ8";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="75wR0AHc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFEC25C6FF;
	Mon, 27 Oct 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577401; cv=none; b=XHnFNDUIjFhezbZg6Ufut4+vdoX/GncDv0qWXyiIRFAD/HtnkQf4965lUHwG+xB8PCmdOgCWaXiejatTWKpWxiPDRkqUzV/YSGD5/xFUcNcgye+mLu8r1EMMg9slhViiHl9VwVjugdmLYLhkC+aAa2BNigmyboJjwb4SwXNdEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577401; c=relaxed/simple;
	bh=p3JPdkWQ/srC7uCKjnV16srJh9dhiQc4oJL6lj3SAGs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=HOLlBLyiEb1rlMxPHoSHUsHrUjkS74q2RZ3i6cxbTk7jztUAFq4TziWaoqPRSmc8eXjLIuoEE5cuniqgfaXnJLDRcvW2TWHTT471UVkj42FM+ri34FdPqzI3BE1Wuqi1lXKsQnPxtyon8ZxPN9+wYBKz/lMfa5HLRxbaDK4AzCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qhGQecJ8; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=75wR0AHc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:Subject:To:Date:Message-ID; t=1761577357; bh=wMsfZFMBQ9tGZwvCLCnJXR2
	Hm5Rqr2/NwAy0P8UbXFE=; b=qhGQecJ8TnUOLL1RwPsDhFtmQKTf86K1lG0jF/42nXQ775TjTH
	xnsU7rcIhfBcyHedrRx9ql/msLdc9jq10ORFDrpiq6p1sID5DIhOmoHyyiPvg0y1EWSvG9j20Hq
	MLnjyOx3+EQBxnjaCZYPFy4V+ID/FYYBS53erEaUmKO2u/NrOkEiJO45cUHdBnINj39dmaGO+/Y
	I6TUHXRJfmRI83ebult6fBukPcCOyuoNrPUPKrj6Vdz01lvu9+cWVaBz0LiVhXzKtgvQW0568At
	XPlt09PMJBKYF7yMkwF9Jcgfc2XBPMMTL1dKdqTSZrHsfMo2N2c0exI3NpuvuE67xiw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:Subject:To:Date:Message-ID; t=1761577357; bh=wMsfZFMBQ9tGZwvCLCnJXR2
	Hm5Rqr2/NwAy0P8UbXFE=; b=75wR0AHc5hd4cMBvQz+x6MF7Nk7O9DQbLSEGXeXEr0fnC+aJQd
	0Txx7+yY5Bjxt6oOFvLY1qqmrAyqnAOcahBg==;
Message-ID: <5c3b0229-c785-4fb3-8578-8ae400c483f8@mainlining.org>
Date: Mon, 27 Oct 2025 20:32:32 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: adrian@mainlining.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, hansg@kernel.org, krzk+dt@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, neil.armstrong@linaro.org,
 phone-devel@vger.kernel.org, robh@kernel.org, rydberg@bitmath.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
Subject: Re: [PATCH RFC 0/3] Input: add initial support for Goodix GTX8
 touchscreen ICs
Content-Language: en-US
From: Piyush Raj Chouhan <pc1598@mainlining.org>
In-Reply-To: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Piyush Raj Chouhan <pc1598@mainlining.org 
<mailto:pc1598@mainlining.org>> # xiaomi-raphael


