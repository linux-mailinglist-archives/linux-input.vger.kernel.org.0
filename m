Return-Path: <linux-input+bounces-12982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E8AE1A33
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 13:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9B04A1B8A
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 11:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6448A1624DE;
	Fri, 20 Jun 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Mrjsnqyt"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEE430E828;
	Fri, 20 Jun 2025 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420002; cv=pass; b=DmTpKcv4V2qE02HPpmhLmpZ1YIgeoi4FdYISpjJ/eLSG5XOpsQIhItnYtXjD5zxj2gup+OvV2X326wgWaQpJl0ySt81QxHZxIQRMTW6T/IvAuLln1PmQgWbHl8AtDoElmwMLzaLK4tKmR9dhpy53wf8k13NfVs9CJA8i1ZXvNHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420002; c=relaxed/simple;
	bh=mZQXe6YL/SgkGvRD2+yG02kkbd26ygGAuqXUEaPKgNw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=eru+VtWqli3ocZNRMyIFaPbyy4e7qwOfTOgtR0u07UFQAu7XckHS8lxEspmk+N0JmE2+Zfz3vbUv7Wdn6avLDVqgVx24VK3FQJRd10U8qra4/ODLcUkSv92z8W7RtIXcEVkhGF6iu86g972wtKRyJ20pi/kmg9+dEm6OejyWvJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Mrjsnqyt; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1750419994; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mgVVCwNeUA+zZ2AfNWsj22p6ZRdc2JEKPR+UpWlmRAfAo2MkJomFHLtt5kkoSAJ/6olfujIddZlFrUFfje5Txy9+5OChgi9WThZL5Q0UxS92J0pcqdTMRtjhP4j7nYGOYplvAEmMtU6iIVx+6bKqmCFyOGM1eHqAcezXAfJVM+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750419994; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jVlU+DHK8bKMw4or/Qxu1c49pZEhg++nt6bN9qPUsP0=; 
	b=KeMJ2hmx7DYpph9pBScbZ5WII7BoQDUwXJJdT9b77C/CjKhPkBmi3Nm+6+9mh4ZvdgQgchQjBAEfVTSsreV2HbHsxutBJE5FxxT961XbO8vK70PfjJY7AKoRrZ4D+BN7ZNqQxhGK8g2SIUjMOJbzc2LseZPOxBWp7oszrkbclmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750419994;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jVlU+DHK8bKMw4or/Qxu1c49pZEhg++nt6bN9qPUsP0=;
	b=MrjsnqytUrOQc0afK8UmyQSFCv1N/7iX6zIIFOgLlEKiJAJE63d8TP34vG/4jNKB
	4GDUPTNM65YWILfZM/o1DqSu6Md+pezQaok4keXK7nHd7Ma3cD+Xc1XeD1hfIfCd4AH
	iASD18U4cpgzi8WBLGfa9e/jYNv1z8OjvKXkjyBw=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750419992200562.1431572615143; Fri, 20 Jun 2025 04:46:32 -0700 (PDT)
Date: Fri, 20 Jun 2025 19:46:32 +0800
From: Li Chen <me@linux.beauty>
To: "Jiri Kosina" <jikos@kernel.org>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>,
	"linux-input" <linux-input@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1978d296e6c.110b7a29b864290.2503936252680819834@linux.beauty>
In-Reply-To: <446o7on5-8s99-01p9-rq78-4qo9pqo3qpr0@xreary.bet>
References: <20250620021506.12624-1-me@linux.beauty> <446o7on5-8s99-01p9-rq78-4qo9pqo3qpr0@xreary.bet>
Subject: Re: [PATCH v2] HID: rate-limit hid_warn to prevent log flooding
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Jiri

 ---- On Fri, 20 Jun 2025 15:09:37 +0800  Jiri Kosina <jikos@kernel.org> wrote --- 
 > On Fri, 20 Jun 2025, Li Chen wrote:
 > 
 > > From: Li Chen <chenl311@chinatelecom.cn>
 > > 
 > > Syzkaller can create many uhid devices that trigger
 > > repeated warnings like:
 > > 
 > >   "hid-generic xxxx: unknown main item tag 0x0"
 > > 
 > > These messages can flood the system log, especially if a crash occurs
 > > (e.g., with a slow UART console, leading to soft lockups). To mitigate
 > > this, convert `hid_warn()` to use `dev_warn_ratelimited()`.
 > > 
 > > This helps reduce log noise and improves system stability under fuzzing
 > > or faulty device scenarios.
 > > 
 > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
 > > ---
 > > Changelog:
 > > 
 > > v2: Introduce hid_warn_ratelimited to rate-limit the specified log.
 > > 
 > >  drivers/hid/hid-core.c | 2 +-
 > >  include/linux/hid.h    | 2 ++
 > >  2 files changed, 3 insertions(+), 1 deletion(-)
 > > 
 > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
 > > index b348d0464314c..aaba7164a8c9a 100644
 > > --- a/drivers/hid/hid-core.c
 > > +++ b/drivers/hid/hid-core.c
 > > @@ -661,7 +661,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 > >              item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
 > >              hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
 > >          else
 > > -            hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
 > > +            hid_warn_ratelimited(parser->device, "unknown main item tag 0x%x\n", item->tag);
 > >          ret = 0;
 > 
 > While I agree in principle that we shouldn't be flooding dmesg in case the 
 > report descriptor is completely bogus, I think we should be more 
 > consistent then.
 > 
 > I am pretty sure syzkaller produce report descriptors that will emit flood 
 > of "reserved main item tag", but you don't seem to be addresing that case?

Thanks for the suggestion. Perhaps the shorter "reserved main item tag" didn't corrupt my system, 
so I didn't notice. I'll ratelimit it in v3.

Regards,
Li

