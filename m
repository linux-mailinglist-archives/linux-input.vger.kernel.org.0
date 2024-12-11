Return-Path: <linux-input+bounces-8500-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329629ECE59
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 15:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D49516AD33
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 14:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1AB2288CD;
	Wed, 11 Dec 2024 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJKD0sgs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205572288CA;
	Wed, 11 Dec 2024 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926381; cv=none; b=ay2gdOKpWW++XYok4pfw6Sh06FrsxX07uv4hgiWZLJnBsDogAQuj3iJlrsQf/6TRHV8npswB63WbEbn7seuKyv+gRpMDNFqyHPy1t1E+iFpTohjuORHG7aHHlvfD6/4/Svn7GfGv9r4x7kXqRkvCgSY2wkw0fhTG6iwjkZyZbGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926381; c=relaxed/simple;
	bh=srOffsvTQ8yzI5mML4UbKK/rfjAy0Fn/ImjsptPfk4w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cqq/IQG3rdk54j1voPKzlTa5jq+A/IqULBfxUARErJpU2LtYX0VLnOFvZ/GCk+wJ9bKmrJ0pwNTL5dtDAOQDlOwqC41JV8z+IeL6wz7fG2aQCsjbCV0FrceueigzJYcnS4oeyrpYfCXyS0lE2PuYehPYI9571zkG4fXZVw4LqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJKD0sgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F6DC4CED2;
	Wed, 11 Dec 2024 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733926380;
	bh=srOffsvTQ8yzI5mML4UbKK/rfjAy0Fn/ImjsptPfk4w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IJKD0sgsMnnmws2oUyYK7B08gOJ6aq0mtkaRb3hPy6mM0fAmjIhOKorMOqIjeU6dy
	 AwkoipTBhyHqEcUeS8zZ4O0RdIVa3OGqYUDs40rq/2LbklV60+DAZpJKslgpHeNUqq
	 03fsF0m1NwWQo2PRqhBw7DtVHc+fEKRYtLi5rU8MqYJgRM1QvZ2HLarTwM3ou1iOnA
	 uOMvSE0b3vE3HlerxYQHSE8GCE+bBzTKrtqwe+woaTvDRp9S48BnoEHHGRVH/meYe0
	 dQL9/k7w55SKaQYEO6ElqinqHRAvk1pxVaoZ5yct9/8rxeeVWPHbxX6WxewWkN6TjN
	 VdZTvxiriFRfQ==
Date: Wed, 11 Dec 2024 15:12:57 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Stefan Achatz <erazor_de@users.sourceforge.net>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] HID: constify 'struct bin_attribute'
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
Message-ID: <s7rpos00-6n06-por8-4q77-6736p670qo1s@xreary.bet>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Dec 2024, Thomas Wei=C3=9Fschuh wrote:

> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>=20
> The usage of read_new/write_new/bin_attrs_new is a transition mechanism
> and will be reverted again after the transition is complete.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Applied to hid.git#for-6.14/constify-bin-attribute, thanks.

--=20
Jiri Kosina
SUSE Labs


