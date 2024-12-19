Return-Path: <linux-input+bounces-8688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B29F8378
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E725B188C297
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 18:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7752719DF99;
	Thu, 19 Dec 2024 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Y1upXczh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wyvYMUcT"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227651A0BE1;
	Thu, 19 Dec 2024 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633674; cv=none; b=f5e9I8vmDLdF+2kXkZoZT12QF4AMkYMUUbvyCZWrLTIhcVXc/BYOTkGByCU9daRgsAcNZiEqcKyXEyXXhjEtwmmJQ6/2OqFnToWWDjR0U9b+b1hTGsqVbnUAOc/7s9NyN8i5UkFpklQxOk5bH+520FcsQvIXMv/GfSOBiSk1Xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633674; c=relaxed/simple;
	bh=YTC58YF7n8OCg7v4CO4ofooH8Y9ucXVyzhaXSI0Vs6A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qQ7RxGLuLDQzlmthRgjqNftuK1kzNola9xJsyXWMSpfEDjqxjORM5PxMfCQ61YNCoHWI9rrSUyIVk1EwdCYZVQgOM7kLb/c3QNVfk2fn0Mxk0WEJw5DkzC9wSUwNjAjWy/qsne82yElLkiC/XELBUNSSMh33tMpgPTTtQKdyHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Y1upXczh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wyvYMUcT; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 356D9114019C;
	Thu, 19 Dec 2024 13:41:09 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Thu, 19 Dec 2024 13:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1734633669;
	 x=1734720069; bh=xmIM+s1XwcMfQAA9MrUISJEwtnhyQPeLRFAncsFexXA=; b=
	Y1upXczhz5WTF/A/bjvZjP76EK/VRq833Fr4Cw7zTuSWNKNMFoXiBLEbD5EtHsxJ
	5NWV9NRmNbPn1mPt92Lz8aFT0cV3Gv9QhFqf63wVB5Pxi0IxKmbzcLz3+AsWj4br
	TKLcJMmDZtxVT7aYb/VFTEp2ZEyugkItR0HiQvDRdJ6eXD2osyOCUWGu0s1XI1YN
	tSoGU9l8CDXWVKWjtqS13ggjjsLqslOGo+FoXEL+dE4EVLrxj7el8vNXAeDtDjxS
	a5/jXbPZ8UpQUGPAxe1epMfOincmHCRVc5dqmhLMkCcIOVEijjk7G1q5hBGYeRZF
	VVGr8HCerGCV32lfygBg+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734633669; x=
	1734720069; bh=xmIM+s1XwcMfQAA9MrUISJEwtnhyQPeLRFAncsFexXA=; b=w
	yvYMUcTZiTa27LOOnFKLxohKvxDS8+JSUXGgY0qDqikZPnBfEG3wJ3TgpNOMWhDx
	ROj7ep0AU7F2hIaGpBzzwZeB+UN8BlrKK8iQWr+Slsq/LFZ3N4sE2maWlZTe5d2V
	6pNxMwf/jIkqykBS3NySqqTr5p9SChdaZJpJRyUuvZvHxLwc9rCEELy0cVS0hrV2
	8QywrAUDBHZ/u9AKJTmh3velBz4+vIPf8OHcPRcTohTToRDlDcM6n3l1Y0m3/JE6
	FAD6zftniNv1HLLXZyz7bL2TLfPqaPmBHwZ4+KbWd3icTCNF8eBwiVsBSs5LbaZj
	PLJX8rkNcFohcn9FPbKug==
X-ME-Sender: <xms:xGhkZzdl0vSBJ5GJQApNhEaoE7m5u-aQ7x5K5ED3vEdPrJ8DF0IXxw>
    <xme:xGhkZ5OeLo1IASmnqJnYXjVcUa94DECENCa5Z3G8kbgWSnwZ0t5exqvtgZquug4yz
    B0Tq2LKKBOvwSSCQuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhepfeduiedtueffieeu
    feeuueeiffduhfeuffegfeeugeeileeiffeljeeuieegveehnecuffhomhgrihhnpehtoh
    hmshhhrghrugifrghrvgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegu
    mhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvg
    hgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehpvghtvghrrdhhuhhtthgv
    rhgvrhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xWhkZ8juNaBd08-IYE1JezU1ytJZw7-ZCXczm7gOxJHQh_v9gs7-DA>
    <xmx:xWhkZ0_HwYAuseZSirH5CWMxQxkbZQqxKymkvAQi-PuE7vB0iO87Lg>
    <xmx:xWhkZ_uaqmbsYIqaVPpgVWXnv1uuxxeg5N38oz2ND0xFXV4gli9vkg>
    <xmx:xWhkZzEbLAjYgqqYkk4Ts_XhVUDm4TYtXPawJLtdKJIDVDsYZU_WPQ>
    <xmx:xWhkZ5KjF1DAkq21iOk8V3OBNXJio7Z07ERT9nr-sidmYEQWcgUh-o3a>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E5E913C0066; Thu, 19 Dec 2024 13:41:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 13:40:24 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>
Cc: "Peter Hutterer" <peter.hutterer@redhat.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e16e0f6f-9eb0-487f-8c71-3023a17f8afb@app.fastmail.com>
In-Reply-To: <Z2Rmj6V0FFbWUhCd@google.com>
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
 <Z2Ri3cuiRYDap2f6@google.com>
 <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>
 <Z2Rmj6V0FFbWUhCd@google.com>
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Dec 19, 2024, at 1:31 PM, Dmitry Torokhov wrote:
> On Thu, Dec 19, 2024 at 07:26:19PM +0100, Hans de Goede wrote:
>> Hi,
>> 
>> On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
>> > Hi,
>> > 
>> > On Thu, Dec 19, 2024 at 05:01:09PM +0100, Hans de Goede wrote:
>> >> Hi,
>> >>
>> >> Really +Cc Peter Hutterer this time.
>> >>
>> >> On 19-Dec-24 4:48 PM, Mark Pearson wrote:
>> >>> Hi Hans
>> >>>
>> >>> On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
>> >>>> +Cc Peter Hutterer
>> >>>
>> >>> My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)
>> >>
>> >> Except I forgot to actually add Peter...
>> >>
>> >>>> Hi Mark,
>> >>>>
>> >>>> Thank you for your patch.
>> >>>>
>> >>>> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
>> >>>>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
>> >>>>> generates is not mapped.
>> >>>>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
>> >>>>> the expected value for copilot.
>> >>>>>
>> >>>>> Tested on T14s G6 AMD.
>> >>>>> I've had reports from other users that their ThinkBooks are using the same
>> >>>>> scancode.
>> >>>>
>> >>>> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
>> >>>> there are 2 issues with this approach:
>> >>>>
>> >>>> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
>> >>>>    XF86TouchpadOff as F20 - F23 where repurposed to
>> >>>>    TouchPad on/off/toggle / micmute to work around X11
>> >>>>    not allowing key-codes > 247.
>> >>>>
>> >>>>    We are actually working on removing this X11 workaround
>> >>>>    to make F20-F23 available as normal key-codes again
>> >>>>    for keyboards which actually have such keys.
>> >>>>
>> >>>> 2. There are some keyboards which have an actual F23 key
>> >>>>    and mapping the co-pilot key to that and then having
>> >>>>    desktop environments grow default keybindings on top
>> >>>>    of that will basically mean clobbering the F23 key or
>> >>>>    at least making it harder to use.
>> >>>>
>> >>>> I think was is necessary instead is to add a new
>> >>>> KEY_COPILOT to include/uapi/linux/input-event-codes.h
>> >>>> and use that instead.
>> > 
>> > We have discussed this with Peter and came to the conclusion that
>> > KEY_ASSISTANT should cover this use case.
>> > 
>> > Also, this tweak should go into udev rules (/lib/udev/hwdb.d/60-keyboard.hwdb)
>> > instead of adding a vendor-specific tweak to the main atkbd table.
>> > 
>> > For the future releases you may want to add "linux,keymap" device
>> > property to your ACPI/DSDT to control the scancode->keycode mapping when
>> > Linux is running.

I can look into this, but gut feeling is it's a bad solution for the Linux ecosystem as it will limit it to only platforms in the Lenovo Linux program. Be nicer to have a more widespread solution.

>> > 
>> >>>
>> >>> Sorry, should have been clearer in the commit message.
>> >>> I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....
>> >>>
>> >>> Somewhere I had a MS page...but this Tom's HW page mentions it:
>> >>> https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools
>> >>>
>> >>> I'll see if I can find something more formal.
>> >>>
>> >>>>
>> >>>> Peter, I thought I read somewhere that you were looking
>> >>>> into mapping the copilot key to a new  KEY_COPILOT evdev
>> >>>> key for some other keyboards?
>> >>>>
>> >>>
>> >>> Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.
>> >>
>> >> So I guess I got caught off guard by your commit message
>> >> which suggests that only scancode 0x6e is generated.
>> >>
>> >> If indeed a left-shift + Windows/Meta key + 0x6e combination
>> >> is send them this is a different story, since indeed we
>> >> cannot filter on that in the kernel. Although sometimes
>> >> I wonder if we should because we are seeing similar things
>> >> where left-shift + Windows/Meta key + xxxx is send for
>> >> e.g. touchpad on/off toggle.
>> >>
>> >> To workaround this atm GNOME listens for XF86TouchpadToggle
>> >> as well as shift + meta + XF86TouchpadToggle, theoretically it
>> >> would be nice if we can recognize these special key-combos at
>> >> a lower level. But thinking about this that is nasty, because
>> >> then we would get an event sequence like this:
>> >>
>> >> Report shift pressed
>> >> Report meta pressed
>> > 
>> > No, you have to delay to see if it is real press or part of sequence.
>> > 
>> >> <oops special key, release them>
>> >> Report meta released
>> >> Report shift released
>> >> Report KEY_TOUCHPAD_TOGGLE
>> >> <and what do we do with the modifiers now?
>> >>  for correctness I guess we report them
>> >>  as pressed again until the hw reports them released>
>> >> Report shift pressed
>> >> Report meta pressed
>> >> <hw releases the fake modifiers>
>> >> Report meta released
>> >> Report shift released
>> >>
>> >> So yeah handling this in the kernel is not going to be pretty.
>> > 
>> > Yes, we have a form of this in drivers/tty/sysrq.c and it indeed is not
>> > pretty.
>> > 
>> >>
>> >> So I think your right and just mapping this to F23 is probably
>> >> best, but I would like to hear what Peter thinks first.
>> > 
>> > So vendor yet again encoded a shortcut sequence into firmware,
>> > beautiful. I guess you can try to install a 8042 filter
>> > (via i8042_add_filter()) in drivers/platform/x86/lenovo-<something>.c
>> > to monitor for this specific scancode sequence and replace it with
>> > something else (through an auxiliary input device). 
>> 
>> If we want to filter out these in essence fake modifier
>> events then this needs to be done at some core level,
>> because AFAIK the shift + meta + F23 key-combo is what
>> microsoft is telling OEMs to use, so we are going to see this on
>> laptops from all vendors including whitelabel laptops.
>
> Hm, then I'd rather leave it to the userspace shortcut handling to deal
> with. It's probably gonna disappear the same way as others in a couple
> of years ;) and be replaced with some thing else.
>
> And mapping to F23 as I said should be done through udev. I doubt they
> will get all OEMs settle on the same scancode.
>

I'll see if we can find a way to check on other vendor platforms what scancode is used.
If it is a common scancode, across multiple vendors, would the patch be acceptable?

If it isn't then I agree it's not suitable. I assumed it would be common and hadn't really considered that it wouldn't be - my bad.

Mark

