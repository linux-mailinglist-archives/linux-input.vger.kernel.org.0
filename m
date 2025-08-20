Return-Path: <linux-input+bounces-14202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B9B2E4A8
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 20:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D41A27F94
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 18:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E019E279334;
	Wed, 20 Aug 2025 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsdWL0sK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9227877F;
	Wed, 20 Aug 2025 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755713073; cv=none; b=jdvz8vEeQThs22aRYfdGh0kvYopX/LIsNkfIipkvQ+f49LZOsIC3+Q9lw4YQgg58P9l1iCwLsKiVtR8cE0i9l9V75C9o6qp8PFS1y3AWQLXfacHBkHiKNtJ/11sa4wLGOyLIcDeZ0wJvZI9+3Isf+Emx4iqLgSuWEpBE9LFHNaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755713073; c=relaxed/simple;
	bh=rvvyoGDA1l5xdSdJCiEp8kMMpPdCJJBx0oS4Vg5Fw7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MqZ3NnX3tIYGeSX8ffc4pGca9Ah+IDe/YS6UStaTXjL+FTFzjrT2bNHcn6vEbfc5mCFswNzJSPQhOYvJtkou9V868+qfp1nbmfYGbwlD+3jamegRCc6ekbOX7NrKD34+DIuEgRcKVJDOJBzfXAoiQ2jRugJ+5zxqXLPb1H4Mlbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsdWL0sK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF31C4CEE7;
	Wed, 20 Aug 2025 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755713073;
	bh=rvvyoGDA1l5xdSdJCiEp8kMMpPdCJJBx0oS4Vg5Fw7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NsdWL0sKJJPWt+DkebpuucXRPzHdvPolhqlSGtJlFnXucyaY5B3Ug7kJbRO/6GncN
	 bhqDMVk+6nqk6CQExBwaBAYNrXvt8U7+eoX2Bxq48AUvURWjD+2n547g/kxFC/57/+
	 xESQoiBoZKHgiHuAK5LXA4wb0XiOfe5SESSj8kzXTH0ZZcBVF+C+n7tLZVpHrBE2dS
	 zFoQoeH11k773ck/ZOHrrYwk9gYF+YsazIhv33dcLZ8oX7Y9liO6xLyQULIhoeux+B
	 DFfhEF2CVCZ/b/TJZijfyKdSdoeqxZsZSZhjwnYsWNtS1AyX0FidX7uT41jhwOXIsW
	 hq2KB8hyODAdw==
Date: Wed, 20 Aug 2025 20:04:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc: bentiss@kernel.org, luguohong@xiaomi.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] HID: input: rename
 hidinput_set_battery_charge_status()
In-Reply-To: <20250814103947.116139-1-jose.exposito89@gmail.com>
Message-ID: <5r9q33p0-47r4-o4n4-71qq-31np7282o17o@xreary.bet>
References: <20250814103947.116139-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Jos=C3=A9,

both patches now queued in hid.git#for-6.17/upstream-fixes. Thanks,

--=20
Jiri Kosina
SUSE Labs


