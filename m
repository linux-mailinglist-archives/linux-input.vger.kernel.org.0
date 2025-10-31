Return-Path: <linux-input+bounces-15832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1FBC241E6
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 10:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14D53BEF07
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 09:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E0632E139;
	Fri, 31 Oct 2025 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REVspmW6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1832E136
	for <linux-input@vger.kernel.org>; Fri, 31 Oct 2025 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902003; cv=none; b=XxLwU1DmdBpSayLHWFD5/UQKLYUKStldeg6hDt7tp/AHHpYwyMGrRXX9RCkOmnNl+EhTy8G3mrRhsZBcRcVezkDI6ZQSnGuOjtPXoHVvVa/wFex7PtJpQ7cRgs4LTYyZT8p9eutU7LFWG4q2/LtdhwCjB7OrTzsegzZXiJ52DD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902003; c=relaxed/simple;
	bh=GI88zN4NEDPNU8eTmIzSgC/fbf1/QB2qlCE+pPgrL20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUoiy2w/oB5uskYEq+oSuxXwBMeax/ndFuVQvfzV5Pt/g/2vGzeuFse30x6HrUqNOafqEtp/9PA85bG9e7kqBHS2X0bvGBwRF72eVii3sViju0BWbEk5sEMX5MMSEeTCr45wx+jRBTfXcZOwxEhUWFjimyJPBzlcRZRP+I5Z7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REVspmW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE78C4CEE7;
	Fri, 31 Oct 2025 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761902003;
	bh=GI88zN4NEDPNU8eTmIzSgC/fbf1/QB2qlCE+pPgrL20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=REVspmW6zIOR+DHydOV6CcPTt2g42OcNzc7+AVwJ0W3c4qgX7QDTRWqiOiXHtLSU7
	 Z7TO47CVSVYr3F76L9c1CLVsFTkTF47YRhmUDXmPwPY5gdCY6uzyL63oIZoZ+4UFem
	 WLxyhby3Lvf3Fb4/RVBM41oBzZqoUKflVfh8uhGjDLkRa+l3NZAz8xvLDGM78niG25
	 o+8GPI4j4IYnovieOebUYWL+KNlDmL+18+rFoWJhKwUbt+cN3WatrFrWXZnz+H/xTj
	 rIpF3sh8MdAbz76EVQx+kp0hu0Y9xaAQG38jOvrp+UR+5W0Swt5ucOjSNMMQeFu1Qj
	 EAgoMbokCoBxA==
Message-ID: <17f02b01-c71e-4e2e-9e91-757731f3fc2e@kernel.org>
Date: Fri, 31 Oct 2025 10:13:19 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: hid-input: Extend Elan ignore battery quirk to USB
To: Jiri Kosina <jikos@kernel.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Dmitry Torokhov <dtor@google.com>
Cc: mario.limonciello@amd.com, bentiss@kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Barata?= <andretiagob@protonmail.com>,
 linux-input@vger.kernel.org
References: <20251030160643.3775606-1-superm1@kernel.org>
 <s0qn1098-s856-1942-48q7-n3691sn109qs@xreary.bet>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <s0qn1098-s856-1942-48q7-n3691sn109qs@xreary.bet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiri,

On 31-Oct-25 10:07 AM, Jiri Kosina wrote:
> On Thu, 30 Oct 2025, Mario Limonciello (AMD) wrote:
> 
>> USB Elan devices have the same problem as the I2C ones with a fake
>> battery device showing up.
>>
>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>> Reported-by: André Barata <andretiagob@protonmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220722
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> Now applied.
> 
> We'll have to come up with something more sophisticated once/if Elan ever 
> starts producing devices with real battery ...

Actually the provided HID battery is intended to be for
when a stylus is used and to report the stylus battery
values then.

There is an email thread somewhere with some of the ChromeOS folks
talking about dropping the ELAN quirk for I2C touchscreens and
indeed replacing it with something more sophisticated. IIRC
the ChromeOS folks mentioned they would work on / provide patches.

+To: Dmitry, Dmitry do you have any input on the ChromeOs issue ?

In the mean time I do believe these quirks are the lesser of
2 evils. Most people don't have a stylus (which is typically not
bundled with these devices) and even if people have a stylus
not having battery reporting for that is less of a problem then
the false positive low-battery *notifications* which e.g. GNOME
shows due to the battery reporting 0% (rather then not present)
when there is no stylus.

Regards,

Hans



