Return-Path: <linux-input+bounces-4320-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE70904B88
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 08:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AB951C21335
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 06:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D824168C34;
	Wed, 12 Jun 2024 06:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMJXd1HL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762F81649BE;
	Wed, 12 Jun 2024 06:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173595; cv=none; b=CyIO+TNCBZsMQAwb1yum4apTIhCICZahmagFAgMCAuaZixAZvx0VaNn3q6mOd9VtbEAdRM599NLLhI21U/4dERqAd4EkjNu+heq3AnCwSLRqC6+LIZ0SBm/7i8DPlPyJcrudmHwgLMhRhF3TInkJiLMzR763xcYetBlZfFCetq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173595; c=relaxed/simple;
	bh=sQH+ctTBrnaFXqBVQ3P9FoSeWIhSEL3g55kjhK2gcCQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tu5w0NZIrLf1xoCPFMfq/4PlemdA9rD5O/NjWOcsGsgSQHAkn7k42jODfQTFuiRrd6ogEunfDIt/ONsCGRUXEC8mt6wsXJKdtlP9jJVty/A5kzq6YLpdEhiVgkTC4MDKcYA89Zl+oAz0VaMcWVI7y5BUsjnp+nY2/qImAk/4YYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMJXd1HL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718173594; x=1749709594;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=sQH+ctTBrnaFXqBVQ3P9FoSeWIhSEL3g55kjhK2gcCQ=;
  b=VMJXd1HLogVpkz3FVEvaJ4Fs7kexyeEekycHcmvWeB9hGsgCujaD+/DV
   53LPpIvMpdnUaqd2TfyFCS9Xb095vn8sSGTrULG5GYjAKAzSibEfna6pN
   58ipswwYYjHCT+SrNuC5sXoQc3Vmk9JzzyMA3M/op1crLd3nGM65Z41xm
   2SVD8axvdaxWpfakQ2cNCcIfBY/BlAYmrK14vBMLCfQF+Btxhtw4gB88h
   eIuX5nj2ZDp10dXw+yU9UwMTMD4b5k3GQoy9Gh64RJlmjYPwFZKYqcrS4
   N7ybbPPMqSQv8FZr0a03t3a5saoFlvjnkhsj4CJFZDMIQfrR55kEq2y+J
   w==;
X-CSE-ConnectionGUID: BSXy1zvgTaCUVBDq/Xh+WQ==
X-CSE-MsgGUID: pKmZLNnVTP+Dv6suCj0PzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25593976"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="25593976"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 23:26:33 -0700
X-CSE-ConnectionGUID: JGKS937NR8+AHIMi83g6sA==
X-CSE-MsgGUID: NLMuK80MQ1OvZJMLwJDkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40155538"
Received: from rathodpx-mobl.gar.corp.intel.com ([10.213.109.222])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 23:26:29 -0700
Message-ID: <4e68c0164022ca41494c6d577766dd4b66c93e9f.camel@linux.intel.com>
Subject: Re: [RFC] HID: ishtp-hid-client: replace fake-flex arrays with
 flex-array members
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
  Justin Stitt <justinstitt@google.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-input@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Tue, 11 Jun 2024 23:26:25 -0700
In-Reply-To: <AS8PR02MB723798FF6CEF28DCB62FAC958BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
References: 
	<AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com>
	 <80976997acb82fe3e6ba54fa2708c8f40fb3eb00.camel@linux.intel.com>
	 <AS8PR02MB723798FF6CEF28DCB62FAC958BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-06-08 at 11:56 +0200, Erick Archer wrote:
> Hi Srinivas,
> First of all, thanks for looking at this ;)
>=20
> On Sat, Jun 08, 2024 at 01:42:54AM -0700, srinivas pandruvada wrote:
> > On Sun, 2024-05-26 at 15:32 +0200, Erick Archer wrote:
> > > One-element arrays as fake flex arrays are deprecated [1] and we
> > > are
> > > moving towards adopting C99 flexible-array members, instead. This
> > > case
> > > also has more complexity because it is a flexible array of
> > > flexible
> > > arrays and this patch needs to be ready to enable the new
> > > compiler
> > > flag
> > > -Wflex-array-member-not-at-end (coming in GCC-14) globally.
> > >=20
> > > So, define a new struct type for the single reports:
> > >=20
> > > struct report {
> > > 	uint16_t size;
> > > 	struct hostif_msg_hdr msg;
> > > } __packed;
> > >=20
> > > but without the payload (flex array) in it. And add this payload
> > > to
> > > the
> > > "hostif_msg" structure. This way, in the "report_list" structure
> > > we
> > > can
> > > declare a flex array of single reports which now do not contain
> > > another
> > > flex array.
> > >=20
> > > struct report_list {
> > > 	[...]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct report reports[];
> > > } __packed;
> > >=20
> > > Also, use "container_of()" whenever we need to retrieve a pointer
> > > to
> > > the flexible structure, through which we can access the flexible
> > > array
> > > if needed.
> > >=20
> > > Moreover, refactor the code accordingly to use the new structures
> > > and
> > > take advantage of this avoiding some pointer arithmetic and using
> > > the
> > > "struct_size" helper when possible.
> > >=20
> > > This way, the code is more readable and safer.
> >=20
> > Applied and tested, atleast didn't break anything.
> >=20
> > But the explanation above didn't give me enough clue. You have
> > added a
> > payload[] in the=C2=A0 struct hostif_msg {} then using that as a messag=
e
> > pointer following the header. I think this description needs to be
> > better.
>=20
> Yeah, I will try to improve the commit message. What do you think
> about
> the following parragrafs?
>=20
> [I have copied part of the message to show where the new info will
> be]
> > > declare a flex array of single reports which now do not contain
> > > another flex array.
> > >=20
> > > struct report_list {
> > > 	[...]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct report reports[];
> > > } __packed;
>=20
> Therefore, the "struct hostif_msg" is now made up of a header and a
> payload. And the "struct report" uses only the "hostif_msg" header.
> The perfect solution would be for the "report" structure to use the
> whole "hostif_msg" structure but this is not possible due to nested
> flexible arrays. Anyway, the end result is equivalent since this
> patch
> does attemp to change the behaviour of the code.
>=20
> Now as well, we have more clarity after the cast from the raw bytes
> to
> the new structures.
>=20
> > >=20
> > > Also, use "container_of()" whenever we need to retrieve a pointer
> > > to
> > > the flexible structure, through which we can access the flexible
> > > array
> > > if needed.
>=20
> I would like to know if it is enough :)

The apporoach is fine. But I don't like clubbing other changes like
struct_size(). That make code difficult to follow.

Thanks,
Srinivas



>=20
> Regards,
> Erick
> >=20
> > Thanks,
> > Srinivas


