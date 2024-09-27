Return-Path: <linux-input+bounces-6815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B3988769
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 16:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E25CB1C211E7
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 14:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA7E1C0DC0;
	Fri, 27 Sep 2024 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cp5f6pvW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068C1BFE15;
	Fri, 27 Sep 2024 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448337; cv=none; b=Tyo1EzmL0+gFJC6DiDwvRQBShz7q2PAOMBczOKh/zqSGcVjAdSImSS9KZ1w7Y6OSt9GTtuGDiOxQSWfiGVmPwcznrJcV6pOjr2D+iFz1aY5bwz9s3/SdgBFHgFn4ELzZE4a4X6tN+ywObJFs404Es5ISWXFqk1mW9XqmalCHPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448337; c=relaxed/simple;
	bh=AKcPIqZ5+zgmVBoXaw9ytiKXatg95FqsqNs4lZFarVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Of3l5YjA1Dubr5Ig2PPmraE2hCxF2+hB4SppQeN2oUFtI2e9QXLjb3daegjAEHm7b0b+4aiklhsun7UXhJbpdn91vbMAzwB52nSlkB1WHL8BPn9wf6uhWf8KwUtm3qbjU0EIhRKIzxXftD+1DqezSMQwxk/Xk+zM1S/4poO6DHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cp5f6pvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81734C4CEC4;
	Fri, 27 Sep 2024 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727448337;
	bh=AKcPIqZ5+zgmVBoXaw9ytiKXatg95FqsqNs4lZFarVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cp5f6pvWE35oxbIPQtLywsNwotw8O4dECJYgQUnug28LYFvGP56gUpmYN6rMVKYdq
	 5N0KLAQWrlvMjKTVUUilUSiOHsV8tvOVvR4axdRyyNbx6mcY0zz0uHojofWzBS/Hfz
	 b9w7uGqIPf7SDU/y7KQKvrqWgMzGWYsgXeLXxN22/RSHBNbL9YWUS34+SXLfYdGvDk
	 yvINUkpGn/aFY6nsW2xBUoJ2AXqelG/7bCS92Li6vpXYg8bHl/NQ8RGy6j9xXISlyV
	 6lzI4kSW4F6WHhkMytfcVd5yLf3a7xywbXkRjYEXUS6zpWlI6ZqgzH4fHEcX5gd26W
	 kR2+wM8tW5RjA==
Message-ID: <919a3891-4024-4b67-81ae-93f3c87ee37b@kernel.org>
Date: Fri, 27 Sep 2024 09:45:35 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-4-luke@ljones.dev>
 <c88f9f36-37f1-4607-aa0c-2baa671c946b@kernel.org>
 <81e62b04-3c1d-4807-b431-d13cf7933054@app.fastmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <81e62b04-3c1d-4807-b431-d13cf7933054@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 18:20, Luke Jones wrote:

>>> + asus_armoury.mini_led_dev_id = 0;
>>> + if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
>>> + asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
>>> + err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>> + &mini_led_mode_attr_group);
>>> + } else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
>>> + asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
>>> + err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>> + &mini_led_mode_attr_group);
>>> + }
>>> + if (err)
>>> + pr_warn("Failed to create sysfs-group for mini_led\n");
>>
>> Shouldn't you fail and clean up here?
> 
> Honestly not sure. It's only a failed WMI call, and the group doesn't get created for that fail, the others might be fine. I'll defer to your advice on that.

It comes down to whether failures are expected on some machines or not 
in practice.

If a machine will fail to create groups, then yeah you should allow 
skipping.  If it doesn't then I feel you have a much more logical 
cleanup and support strategy if you unwind on any failure.

Hans or Ilpo might have some thoughts here too.

>> I think you should be using this mutex more.  For example what if an
>> attribute is being written while the module is unloaded?
> 
> Good point. I'll adjust code to suit. However if I do, this will trickle through the other patches I've added your review tag to. Will this be okay?
> 
>>

If they change in a material way drop my tag and I can just re-review.

