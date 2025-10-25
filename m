Return-Path: <linux-input+bounces-15722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02999C08D29
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 09:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A0894E9A37
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 07:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049752773E3;
	Sat, 25 Oct 2025 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4xTrnbd8"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06D2222A1;
	Sat, 25 Oct 2025 07:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376367; cv=none; b=sapUUBH+d/uOtqqtdWXpZ8IYExjdXz7riS7Rp1LqSFNGrXQxvP+SYIqh9m13xmzZUFA9QYr6C5tT1tzz7XIeCnD3+r/Fadpisj4V1Lu1/l8FZWJvy503a1E23z+wUl4LuzULLZ8ueypjND0nUgT88Gh4UZWblLBPVwKRbWfwgCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376367; c=relaxed/simple;
	bh=h5myBk7Y9jzgCKKdqfGa3lbhEpXoJK0bpOFNhQDtySs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ad/K5j4nhZeilCDEockOfg1mXi5sZQeq6UtQkhXVPoyvsSqzEIx/yXeolAmrXpFkHh0TSk6+ogYIrVwZtwYzOHPDUEdSm/doYjgcQZZvo4LA+QuaItQteaT9HdmW0cTatrbviv828+HZoDMAWA+x5uhXnhgysv3SHzgrbZ43t0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4xTrnbd8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=64wHHTG8QB3jz1ZnHmV8lL6weqDR4OInJsXbNS1AKF4=; b=4xTrnbd8e1fM5OHPxRo96+1jry
	suNQLeoFRXKFgtMp4q/cHDEjpIzSxmjzUGJhKMsRP8HHVVVnMAmOUcN35Dxfvk6p4ZBLfiaTCHwvt
	PVvwRtKrwZ7MPDmoJHgS9Xs4XQ5MdrzTYDFZsRlZVjU1XwVXldMwWIP471lNmOte5Kt9u159okWqb
	kb3/Cf3KFpdrnhOkD9ouxrmBeft1oK70NFhZzj3o4Bbf2NvXB6WFf0mprFSWcuX5FMKNJFG956PNl
	toca+ldl93MKP1lsUGK0eOkJHF7rICTnfaNtsSSEtknt7k1bc31NS6isNWc8eBYJ+OZ2Z3VdnE6fn
	iZPXI8Iw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYSA-0000000B40o-3wgN;
	Sat, 25 Oct 2025 07:12:42 +0000
Message-ID: <9433805e-c610-4249-a45d-e6e94c0f5522@infradead.org>
Date: Sat, 25 Oct 2025 00:12:42 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hid-alps docs heading cleanup
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Input Devices <linux-input@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masaki Ota <masaki.ota@jp.alps.com>,
 George Anthony Vernon <contact@gvernon.com>
References: <20251024103934.20019-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251024103934.20019-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/24/25 3:39 AM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are two section headings cleanup patches for Alps HID documentation.
> Enjoy!
> 
> Bagas Sanjaya (2):
>   Documentation: hid-alps: Fix packet format section headings
>   Documentation: hid-alps: Format DataByte* subsection headings
> 
>  Documentation/hid/hid-alps.rst | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Much nicer. Thanks.

for both patches:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

