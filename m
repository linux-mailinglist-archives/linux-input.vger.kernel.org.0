Return-Path: <linux-input+bounces-16247-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533CC73DD9
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 13:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7591A3549F6
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 12:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B7B308F36;
	Thu, 20 Nov 2025 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPFDe18t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fiBSJsWN"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7100F319862
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640217; cv=none; b=Qn5wB4mnuXG6136r86mzgKZol11+2/l1f1MdvGZGcck7vM5GEehhFnlvooKsXBmNrHWTDD3Fb57HeYfNCaqVGUpCY36QS8Rve+PMDa9rJbVyYI9dDp7C+DgTNg1yjS8wMXTQzF/USnO4I4AI0Es/zcNGWJhOC33d3VW2/YLHE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640217; c=relaxed/simple;
	bh=oAVWXgSdg1EnTj70qQ8NTF8fiS8Go0e4Jq6eIEOGv2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+XX48iRkmZ1+2JpzXGA/Ds00DPYNW42uYZkXQ/mY4bAk301uNykHtbzDWd/E0VV8hf/v2ew4NrH5hZaRvFhIodbaeP+lC+5/MI8WNiKiyHo4DlUyhjZSI9ilt+iKmr0p5q4muuBRwxxjG2Otw5qN/Rq9PJA04/y0BMtr+b6RG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPFDe18t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fiBSJsWN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763640213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/HN+2O8TCI3VxW+PAB3+Kpa9bj72bqXQboZb5I5v2I=;
	b=gPFDe18tQtQBLYGMtY1RuZIoDLnQ2Zxe7oYosPiQyAoAKPZK/VNvcbmIaauPIMGTeSHjOv
	6tkWaHotKwCuVJh3nKwlUx1VpBnviGLsWzl784LlIqIDv55csyVwJ0zGtzE5bhEFTvywfF
	MJb5q2pb04d+C4OF7bKDltI0JyCtCgE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-ly1zav4NNA-IovvsHiJNbg-1; Thu, 20 Nov 2025 07:03:32 -0500
X-MC-Unique: ly1zav4NNA-IovvsHiJNbg-1
X-Mimecast-MFC-AGG-ID: ly1zav4NNA-IovvsHiJNbg_1763640211
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429c5c8ae3bso581059f8f.0
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 04:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763640211; x=1764245011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/HN+2O8TCI3VxW+PAB3+Kpa9bj72bqXQboZb5I5v2I=;
        b=fiBSJsWNfw0bB+fbbXzkqUGHmXAbFuqPyOFy2s50X1OHb/txp1uXrUoGuqY4UPzVu8
         a4O+cKLP1dmuFAO/fw5gbr7NSL1P8eaqxgXWdAt+BfqrLjEdJkyqJ8D3RWka6BSdKQ3a
         22zOe6TrJdK+xnw003pbjUJKCImMH/qjdoL2AzK5D33xN4/gupnlpa2M2Ss4fPkMXUt9
         iq6QoqeSQN67r4oa5vxF0O0B+YOH2esXgLgnIm0doyKt09FJTpLMEapicVgnd1El8xvw
         k8QeWucxinnr78ZTH7AnkWCOXBeKF1OSOq3tu0F3wv1Xyedu66CG4TMB10Np23L9dc4l
         VduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640211; x=1764245011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/HN+2O8TCI3VxW+PAB3+Kpa9bj72bqXQboZb5I5v2I=;
        b=lzgcgloKizaAhkQCUe0fG3+09ArcHVDCIGU46tXa1W8ybHzpm+7mIYlrJyJWR+eJK9
         DhFFhxwDAyn9v+/Jg6sCgfIJaWmQTMItgw4bBj5GvKYaQp7kiIl+z2QWEWm/NZ2ivMd2
         8nC7mgyQjcYTGCm+7wkPwWYYKRMt+VEo/BoGIuatqQat4U2b6V6IP+5aX6q0zYla/1NW
         tF1yZdvXlVulxYd5HaKqswciop2zdTVhlsKvpE1Z9968/EEjErlWzz/qyLD99eUbpVz6
         BwqawliPpKp9Sbs+MfTwLHK+5wAXGwQNsMBofk55R2ECtkz6LWotwS9Fks+ijUW/zVYX
         zITw==
X-Gm-Message-State: AOJu0YwkSowhmaksGu7oAfaif4W/BIIdeULlMUFwS5Oj0s1zOpvw8FnF
	26icfv3/gsdtbbAyyZkmhwPhQsK5IaDGnQ5JZAE14xuXJNz5bQEROgSJEa9YVTp3FdF2o0XE3ed
	ofxbFtsFgfvh89M2RXy1CHsSuX/D7iaszDZslvWs3BLqtbddNd3fCQg5WG7g0uNPgojekODgvg1
	ka3sfZJvt4Yisxw0d0DhpB03ffYjQCIb8SuOhVXAI=
X-Gm-Gg: ASbGnct58xfq/WwJzU8sCbKg2yjY9D04kDqA9RfjFXlKyIsQcP181bBFPCtqCf1G2Um
	4qXtyxbjefko43Zq7MENtpvp8BpJUAGhBC0UnocDkamIHudtkrIwxONf+yC2FYyY9XgFfpi1vw5
	9tdD2rMIH8hpRYHc18eyoY3PKWIRHAu8kUTtOgR5D5ScLYcmQJpAnZh51MGT5U35t2Q1VkDVb84
	85YhC3hnCiyWJu0kiifWe/gKF8sa/xFj6IZyUUeM0GzFFNeC+CgchY=
X-Received: by 2002:a05:6000:18a6:b0:429:cda2:9ffe with SMTP id ffacd0b85a97d-42cb9a19605mr2720696f8f.7.1763640210648;
        Thu, 20 Nov 2025 04:03:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7pVuMRwkepP9mL0oN/EtM6q/AgCLHGiXWuGcFXkRu1RDrURQylA/XBN0/pdt3QQYDGO4WtPEGHSNrWR0kdA8=
X-Received: by 2002:a05:6000:18a6:b0:429:cda2:9ffe with SMTP id
 ffacd0b85a97d-42cb9a19605mr2720652f8f.7.1763640210175; Thu, 20 Nov 2025
 04:03:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120105442.150508-1-lzampier@redhat.com> <pr3w6zp5hoza27fncktfj3qx3wp2nhdglbx46fbfx6swm4772d@7hg7a6dxom7p>
In-Reply-To: <pr3w6zp5hoza27fncktfj3qx3wp2nhdglbx46fbfx6swm4772d@7hg7a6dxom7p>
From: Lucas Zampieri <lzampier@redhat.com>
Date: Thu, 20 Nov 2025 12:03:18 +0000
X-Gm-Features: AWmQ_bmQYMqW-hozML6HBmVQB7_BoMAgOcEgSIkNIYG74-V2es8KnwG_fQguJPs
Message-ID: <CAOOg__BCM_s+Mm8e6NcwwVhQLyZ3z2iMwX1FOwC_7drNd8gEjg@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] HID: Add support for multiple batteries per device
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Sebastian Reichel <sre@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 11:05=E2=80=AFAM Benjamin Tissoires <bentiss@kernel=
.org> wrote:
>
> On Nov 20 2025, Lucas Zampieri wrote:
> > This series adds support for HID devices with multiple batteries.
> >
> > Currently, the HID battery reporting subsystem only supports one batter=
y per
> > device. There are several devices with multiple batteries that would be=
nefit
> > from this support:
> > - Gaming headsets with batteries in both the headset and charging dock
> > - Wireless earbuds with per-earbud batteries plus charging case
> > - Split keyboards with per-side batteries
> >
> > ## Proposed Solution
> >
> > This series introduces struct hid_battery to encapsulate individual bat=
tery
> > state, replaces the old battery fields with a list-based approach, and =
adds
> > support for multiple batteries tracked within struct hid_device. Batter=
ies
> > are identified by report ID. The implementation is fully backwards comp=
atible
> > with single-battery devices through a helper function.
> >
> > ## Testing
> >
> > Tested with split keyboard hardware (Dactyl 5x6) using custom ZMK firmw=
are
> > that implements per-side HID battery reporting. Each battery (left and =
right
> > keyboard halves) reports independently through the power supply interfa=
ce with
> > distinct report IDs (0x05 and 0x06).
> >
> > Test firmware available on my personal fork at:
> > https://github.com/zampierilucas/zmk/tree/feat/individual-hid-battery-r=
eporting
> > If this series gets merged, these changes will be proposed to upstream =
ZMK.
> >
> > HID descriptor and recording captured with hid-recorder:
> >
> > D: 0
> > R: 162 05 01 09 06 a1 01 85 01 05 07 19 e0 29 e7 15 00 25 01 75 01 95 0=
8 81 02 05 07 75 08 95 01 81 03 05 07 15 00 25 01 19 00 29 67 75 01 95 68 8=
1 02 c0 05 0c 09 01 a1 01 85 02 05 0c 15 00 26 ff 0f 19 00 2a ff 0f 75 10 9=
5 06 81 00 c0 05 84 09 05 a1 01 05 85 85 05 09 44 15 00 25 01 35 00 45 01 7=
5 08 95 01 81 02 09 65 15 00 25 64 35 00 45 64 75 08 95 01 81 02 c0 05 84 0=
9 05 a1 01 05 85 85 06 09 44 15 00 25 01 35 00 45 01 75 08 95 01 81 02 09 6=
5 15 00 25 64 35 00 45 64 75 08 95 01 81 02 c0
> > N: ZMK Project Dactyl 5x6
> > P: usb-0000:2d:00.3-4.2/input2
> > I: 3 1d50 615e
> > D: 0
> > E: 0.000000 3 05 00 56
> > E: 0.000977 3 05 00 56
> > E: 1.490974 3 06 00 52
> > E: 1.491958 3 06 00 52
> > E: 6.492979 3 06 00 53
> > E: 6.493962 3 06 00 53
> >
> > The recording shows both batteries reporting with different charge leve=
ls
> > (Report ID 05: 86%, Report ID 06: 82%-83%), demonstrating the multi-bat=
tery
> > functionality. This can be used to verify UPower compatibility.
> >
> > ## Future Work: Userspace Integration
> >
> > As suggested by Bastien, semantic battery differentiation (e.g., "left
> > earbud" vs "right earbud") requires userspace coordination, as HID
> > reports typically lack role metadata.
> >
> > This will require:
> > 1. systemd/hwdb entries for device-specific battery role mappings
> > 2. UPower updates to enumerate and group multi-battery devices
> > 3. Desktop environment changes to display batteries with meaningful lab=
els
> >
> > This kernel infrastructure is a prerequisite for that userspace work.
> >
> > Lucas Zampieri (1):
> >   HID: input: Add support for multiple batteries per device
> >
> > Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> >
> > Changes in v4:
> > - Added missing hidinput_update_battery() stub in #else block for
> >   CONFIG_HID_BATTERY_STRENGTH=3Dn builds
> > - Reported-by: kernel test robot <lkp@intel.com>
> > - Closes: https://lore.kernel.org/oe-kbuild-all/202511201624.yUv4VtBv-l=
kp@intel.com/
>
> I don't think you need to keep the formal tags here in changlogs of the
> cover letter. A simple "as reported by kernel test robot
> <lkp@intel.com>" should be sufficient (given that usually we end up
> dropping the cover letter as we apply the patches only).
>
> >
> > Changes in v3:
> > - Squashed the three v2 patches into a single patch as suggested by
> >   Benjamin
>
> Sorry we didn't understood each other: I was asking you to squash
> patches 1 and 2 only, and keep 3 separated. I was just complaining about
> a blank header change. Separating the non functional changes from the
> functional ones is important.
>
I get it, but the reason I made it one patch instead of two was to
have one functional patch hid-multi-battery patch, instead of one just
adding the structure, and then another one to really make use of the
multi-battery stuff, but I guess I can make it two again, even tho the
first one will have no real change in behavior

> > - Removed all legacy dev->battery_* fields, using list-based storage on=
ly
> > - Changed battery naming to include report ID: hid-{uniq}-battery-{repo=
rt_id}
> > - Converted battery memory management to devm_* for automatic cleanup
>
> Haven't checked the code yet but that would require probably a separate
> patch so we can bisect to it if anything breaks.
>
I guess I kinda coded myself into a corner here, as with the new
devm_* changes, I wrote the v4/v5 hid-multi-battery feature to be made
for it, so I would have to go back to the v2 implementation (which is
fine, its just that the new devm_* makes it much cleaner), and then
have another patch converting the whole to use devm_*, which might as
well be a separate series at that points so it's easier to
review/test/bisect. Likewise, I'm fine with either approach, your
call.

> > - Updated hidinput_update_battery() to take struct hid_battery directly
> > - Added hid_get_first_battery() helper for external driver compatibilit=
y
> > - Updated hid-apple.c and hid-magicmouse.c to use new battery API
> > - Simplified cover letter based on feedback
>
> Heh, thanks :)
>
> Cheers,
> Benjamin
>
> >
> > Changes in v2:
> > - Split the monolithic v1 patch into three logical patches for easier r=
eview:
> >   1. Introduce struct hid_battery (pure structure addition)
> >   2. Refactor existing code to use the new structure (internal changes)
> >   3. Add multi-battery support (new functionality)
> > - Added detailed testing section with hardware specifics
> > - Added hid-recorder output (dactyl-hid-recording.txt) demonstrating tw=
o-battery
> >   HID descriptor for UPower validation
> > - Added "Future Work: Userspace Integration" section addressing Bastien=
's feedback
> >   about semantic battery differentiation
> > - Added hardware examples with product links to commit messages (per Ba=
stien's
> >   suggestion)
> > - No functional changes from v1, only improved patch organization and d=
ocumentation
> >
> >  drivers/hid/hid-apple.c      |  10 +-
> >  drivers/hid/hid-core.c       |   4 +
> >  drivers/hid/hid-input-test.c |  39 ++++---
> >  drivers/hid/hid-input.c      | 196 +++++++++++++++++++----------------
> >  drivers/hid/hid-magicmouse.c |  10 +-
> >  include/linux/hid.h          |  54 +++++++---
> >  6 files changed, 187 insertions(+), 126 deletions(-)
> >
> >
> > base-commit: 0678f5630429a5049d7663703b897e1bf8d13cd1
> > --
> > 2.51.0
> >
>


