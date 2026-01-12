Return-Path: <linux-input+bounces-16997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7659D14B9F
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 19:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31333300A6CE
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 18:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8631B387561;
	Mon, 12 Jan 2026 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="kpxyIHNm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ew9pTgVh"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F12D9496;
	Mon, 12 Jan 2026 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242053; cv=none; b=iZV69wuOIIxO4JiAAhOzrbpe1jjmhKzqqlAsxJX2gu+JWBYV5Te8IPuq3CN78m1xMRBbYivWERyr/XqujqZO/2lhqqhs3eEmRAzBJe4dssLBCiLc4RT6PRyl4/wVm0EuM6SALsxteI6mfqKRvo2KPnVUHeTQwhsXydFGkajINPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242053; c=relaxed/simple;
	bh=0MIsQPEMKnW1e4juI0TNrUwQskLGzb2wCSPvKVdOWds=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aoCbhiq2Y/Oe1KfKUTb3aW+V9+S8+5NP31rzz4Ia3GJr6wL4E5cd4kM1UoZT/Pc8BipQ/5dogixTEbVPzJxMn466Igs4JcxkLVntmUqd87dXeQA3okw9w5h5zp0Quv0SSTrTf50sn/w3exvaRNE06vNzVS04hQfOu1ceWzy6TQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=kpxyIHNm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ew9pTgVh; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 12D4C1D000E9;
	Mon, 12 Jan 2026 13:20:50 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 12 Jan 2026 13:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1768242049;
	 x=1768328449; bh=O4EudzFjIiugLvsbHDKdmXPJwZkcSMwAsTeW+doPJx4=; b=
	kpxyIHNmkFMWTjMBPtbDkfo35ayO/4cyxXv9b006NHlzn5J65YShQZuR++rS1mje
	lzsLUe0duV1LTCNgo4TD1Qq9m6zXd9L/sPXSx60GPxwM2ROkGYGxl0FBEAUAgR9X
	YCVCls4ffQ0xgaxN6kmJVsNXp0cow2CpWSWEIxoiHmeKn084HeDlupQ1GbUwz54M
	p7GVec8gkRrNbohgPN0pP341VqUZRqx9xiEk9nBVxWi+bHmV6Tf8qGs1aX1XTFx5
	0fQ/bmrnGgc2aZ5LtuOufRh+PWqVFEqsKmOD3Nn6Y6oL16O/rglI5mdZjjWckDh5
	EiVkR8F1tvCEhgFZh64afg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768242049; x=
	1768328449; bh=O4EudzFjIiugLvsbHDKdmXPJwZkcSMwAsTeW+doPJx4=; b=e
	w9pTgVhoDdsutmTfttKM+/Tv1J8cEleoUDgzLKTrojD/C5+vkt6TH6Palbz+tW+J
	2gHdEMNwifs0TBRXM73SD9PSt+/3bxEbZTCUtmQB9JmRXF5yw3mXuQ2QT8+pErQX
	cKCMKFiL+HhUT65VqrC1va6XKspm+Am5o7iLfzIhzUMS2Wq1h2ZuR0lMGnBCO7MO
	uTEqJ5PosvAX5wkPOjvLzKAfGMvJjJrE82sff2R8Tt2O9PeOraUsUHstIU4oKVTY
	dKrbGYs5/2W+CNvg8E+nqCahj42Di+PG5RJhwm/fQHiQCp9qv0qoAPTv6CdqL3/8
	7zvaQ6Nr4YCbdBDvEZUTw==
X-ME-Sender: <xms:gTtlaSb0D1IgUQS5-oXLuJ3aKH7m1EuTKPbZv4TjNbt8G6s0RB6m6Q>
    <xme:gTtlaQPsuygVPQ5jt0gwbcuubazaEpaxjr7HIMhUqPLqr5zvOTvLKGjU0NB_4sN-A
    R5O6BHtKFg-VVoMBjk_cpJdPEm4GcsTl1AV_KvDKV-_1XvFW-DuvXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudekudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedv
    geekhfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrh
    hiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopeguvghrvghk
    jhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhtihhssh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepshhhrghohhiiudeslhgvnhhovhhordgtohhmpdhrtghpthhtohepii
    hhrghnghiigiefieeslhgvnhhovhhordgtohhmpdhrtghpthhtohepphhgrhhifhhfrghi
    shesvhgrlhhvvghsohhfthifrghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdguoh
    gtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gTtlaf6JVa5xTzTUlVqtF68XmLmqda2T1uAKaY190o1Q-fgWk05bfw>
    <xmx:gTtlaUm3CBgdoAFRugojI1BZEoiXHypioKWw4RxutaGKepUArOuPLQ>
    <xmx:gTtlaSEmJrhIQCWr46Dme0huYAy6ijLgeeIb_JQh9SnUj20ApnzgQw>
    <xmx:gTtlab8lOmof8GO16JKaTsTnYvv8HT4VjzxEQf9W-TracZ1vycfFVg>
    <xmx:gTtlaYmvTeSnr3LmG2KOw2pvC0pAaFgXirYbxLuLcfBjW0y_Q2x5BLNN>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B22B62CE0072; Mon, 12 Jan 2026 13:20:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AC9rIZzNZkww
Date: Mon, 12 Jan 2026 13:20:26 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Jiri Kosina" <jikos@kernel.org>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Zhixin Zhang" <zhangzx36@lenovo.com>, "Mia Shao" <shaohz1@lenovo.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <2910bb2e-6b31-42f3-a3de-463327b16ff1@app.fastmail.com>
In-Reply-To: <6BB4F74A-F440-4F21-B094-62CFD18C599A@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
 <20251229031753.581664-3-derekjohn.clark@gmail.com>
 <0on4p9s6-7512-9408-49no-3292o86113r3@xreary.bet>
 <6BB4F74A-F440-4F21-B094-62CFD18C599A@gmail.com>
Subject: Re: [PATCH v2 02/16] HID: hid-lenovo-go: Add Lenovo Legion Go Series HID
 Driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 12, 2026, at 12:40 PM, Derek J. Clark wrote:
> On January 12, 2026 4:12:43 AM PST, Jiri Kosina <jikos@kernel.org> wrote:
>>On Mon, 29 Dec 2025, Derek J. Clark wrote:
>>
>>> Adds initial framework for a new HID driver, hid-lenovo-go, along with
>>> attributes that report the firmware and hardware version for each
>>> component of the HID device, of which there are 4 parts: The MCU, the
>>> transmission dongle, the left "handle" controller half, and the right
>>> "handle" controller half. Each of these devices are provided an attribute
>>> group to contain its device specific attributes. Additionally, the touchpad
>>> device attributes are logically separated from the other components in
>>> another attribute group.
>>> 
>>> This driver primarily provides access to the configurable settings of the
>>> Lenovo Legion Go and Lenovo Legion Go 2 controllers running the latest
>>> firmware. As previously noted, the Legion Go controllers recently had a
>>> firmware update[1] which switched from the original "SepentiaUSB" protocol
>>> to a brand new protocol for the Go 2, primarily to ensure backwards and
>>> forwards compatibility between the Go and Go 2 devices. As part of that
>>> update the PIDs for the controllers were changed, so there is no risk of
>>> this driver attaching to controller firmware that it doesn't support.
>>> 
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>  MAINTAINERS                 |   6 +
>>>  drivers/hid/Kconfig         |  12 +
>>>  drivers/hid/Makefile        |   1 +
>>>  drivers/hid/hid-ids.h       |   3 +
>>>  drivers/hid/hid-lenovo-go.c | 734 ++++++++++++++++++++++++++++++++++++
>>>  5 files changed, 756 insertions(+)
>>>  create mode 100644 drivers/hid/hid-lenovo-go.c
>>> 
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 9ed6d11a7746..b5ad29d24e3e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -14135,6 +14135,12 @@ L:	platform-driver-x86@vger.kernel.org
>>>  S:	Maintained
>>>  F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>>>  
>>> +LENOVO HID drivers
>>> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
>>> +L:	linux-input@vger.kernel.org
>>> +S:	Maintained
>>> +F:	drivers/hid/hid-lenovo-go.c
>>
>>Hi Derek,
>>
>>thanks for working on this.
>>
>>I am now almost finished with reviewing this pile and am planning to queue 
>>it in hid.git shortly, but I have a question regarding the MAINTAINERS 
>>entry above.
>>
>>The title claims support for all of Lenovo HID, but there is much more to 
>>it than drivers/hid/hid-lenovo-go.c, specifically in hid-lenovo.c.
>>
>>So either please make the title more specific (or claim the ownership of 
>>the whole Lenovo HID landscape indeed, fine by me, but the please reflect 
>>that in F: :) ).
>>
>>Thanks,
>>
>
> Hi Jiri
>
> Sure, I've debated using LENOVO LEGION GO HID drivers and LENOVO GO HID 
> drivers. Do you have a preference? The other drivers are pretty old and 
> I don't have any hardware that would use them so I'd prefer to keep 
> them separate (though I'll acknowledge that they don't seem to have a 
> MAINTAINERS entry)
>
I should probably take a better look at the lenovo-hid driver.

The platforms that it's supporting weren't in the Linux program, so it never crossed my path before - but looking ahead I think we may need to contribute some changes there (guessing a little, but I'll know in a few months time).

Jiri - as that driver is targeted for Thinkpads, I'm OK to take some responsibility for it if that is useful/helpful.

Mark

