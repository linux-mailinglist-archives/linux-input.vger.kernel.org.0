Return-Path: <linux-input+bounces-13003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEE6AE4D3B
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 21:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3B23A4E49
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 19:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7706A1D9346;
	Mon, 23 Jun 2025 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZIi1748"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176F2566
	for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705393; cv=none; b=DCN8wCueEqxV8C8CeCG4RLEcovaBjUUrD5QekRTBKJNQKzvebu0lU/SZXvewc7pAMMtuoE3/eYlxgb3cTYHKttZvN1drF6ARkAIfgfLpDAGBsxAZhZ+2QuSoFszLUwxLV5Dm2cQdj0TuwX5ZkS3cI53tAQ1BGlxPk1XRi1+HFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705393; c=relaxed/simple;
	bh=Il/UUwZ+oJOfGjIMBWrVNK4rksfGKZX1Yo90EJhGIds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BF1E/0RS5xzn/Aj4omFh38QtAUIovCnjKMtFqoEqs5Ug/nNeqQ+DNLTXiyCwQ7qDWZ2aUGzPul5ekStkb7g1i5QgOOd3yuoXxewWrrL12AhKt1P2cKKPTTxPyIkxbDg0UXZqZy/mZcKk4PsegZYe1yt+cn1aIy7sZyOkm8I2VkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZIi1748; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88341C4CEEA;
	Mon, 23 Jun 2025 19:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750705392;
	bh=Il/UUwZ+oJOfGjIMBWrVNK4rksfGKZX1Yo90EJhGIds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZIi1748lHDm353w5F2OzUjjwDOMhosejim8xXl00d/9EmR8h6rXAS4Xj4LHYXriU
	 aiQ67vbsZ688TUcKXctQ9ESF3uuZWH9xlqr9jps79DBrma/lMisO59gPwEWtbL/ZxJ
	 F91XT75BSo8/EN6F7H1BqSxZ/e+7889McDC+01MX1SqXI/boeFT/5aO3uJWEU+ii+O
	 K1V8ebCvAtKMy00/l9s309EX6PyvDU9kG7umiuHrRdLqxSEsQXvJFMeyN90E1rmO9U
	 4w9mqwYJk8u5HBDvVbvE2rvi34KVhPMBC+8fKh+xfJuvoW1UUjgOehdAq9p0taFf04
	 D9CswUA60W4CQ==
Message-ID: <7b45e6ee-645e-4955-9dd2-1a4bcd920dad@kernel.org>
Date: Mon, 23 Jun 2025 14:03:11 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Adjustments to xpad handling for unplug
To: Mario Limonciello <superm1@kernel.org>, dmitry.torokhov@gmail.com,
 rojtberg@gmail.com
Cc: linux-input@vger.kernel.org
References: <20250609014718.236827-1-superm1@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250609014718.236827-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/25 8:46 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> When an xpad compatible device is unplugged there are errors in the logs
> and the correct error code also isn't passed up.
> 
> Mario Limonciello (2):
>    Input: xpad: Adjust error handling for disconnect
>    Input: xpad: Return errors from xpad_try_sending_next_out_packet() up
> 
>   drivers/input/joystick/xpad.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 

Gentle ping on this series.

