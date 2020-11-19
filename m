Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B562B9636
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgKSP0K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20456 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728656AbgKSP0I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605799567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wFBpf4aF5l3Vov+SDr/1VipD16OT3kd9CrTIp3FflAg=;
        b=d1azDTwo8mZWQ5OZOX+66bIJrDAJnEXMlIZnchOCcTLsphe1XdTaX9B0GsiZOtsuXk88Dc
        vmwN6GEqiulVeAGm1hBqpUR0Yll6oVhbA24H7U+rJXf1J7OTaewLHN0CqV8HBzDZPg5U5U
        OVEg9j07WnCLgzMpRviaYaLSndvy3yM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-YsmJqe5bN5C_C2v6tD5VWA-1; Thu, 19 Nov 2020 10:26:05 -0500
X-MC-Unique: YsmJqe5bN5C_C2v6tD5VWA-1
Received: by mail-pg1-f197.google.com with SMTP id c4so3689017pgb.0
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wFBpf4aF5l3Vov+SDr/1VipD16OT3kd9CrTIp3FflAg=;
        b=dUjAvvC7co7ed0bphm1LdGhqqza/oR8vZrtBDtnadvV396nWjdoJUuPxd55N2JZ8P4
         eTa1Vkk+4u5w1+L4+VdYfYKL5yXfFZclQGoFeRRnKbnf57K/3FhzFgKTYhgKseJSPMBC
         zyPxt5hx9pnosZUnKlJB+ELWcuM3fd14tL0e/XMlHoUw+CgW8kLTi5RcHX03ARBqj44L
         sXtdnCk3joZhG8hopwVM0OsLjbm9YjpA5yqjG2qW0I+L5DZK28f5FQRhpg7zCO7g7a+N
         myrkU9w2xa5xJggD1t0naGk29TOF/J3qteJUrcsoOtOb2feA2W+pPKNxWiCgSP+9qBeC
         nrKw==
X-Gm-Message-State: AOAM533DyvYPsbtCueyB85dzshiNIzdMmdrh/LD9bpabIq+GSlko7WJ3
        ej9E7Q4LfP4lT3TUxruC1sC7pWxRVhDAhmefZC92uT0/GbLXydVqgX7qNgF8ncSzOLvNquUez4g
        dBlcMWOz1aM5OsqRmg8W8Vwu6WQYkepAK+6Hwto8=
X-Received: by 2002:a17:902:7890:b029:d8:bb20:518e with SMTP id q16-20020a1709027890b02900d8bb20518emr9429736pll.66.1605799564441;
        Thu, 19 Nov 2020 07:26:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAuYEKOyD643Q9foZwqDDabzv0ZpcZHJVRZ+HH+9J8VoI44sbFl4OrKkNuQSYbrI2/M0cUkv9vik+iTyiv/LI=
X-Received: by 2002:a17:902:7890:b029:d8:bb20:518e with SMTP id
 q16-20020a1709027890b02900d8bb20518emr9429712pll.66.1605799564156; Thu, 19
 Nov 2020 07:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20201114212058.19590-1-hdegoede@redhat.com>
In-Reply-To: <20201114212058.19590-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 Nov 2020 16:25:53 +0100
Message-ID: <CAO-hwJJN-1P3XW4i-8R=JBjyFvvyiHK89tN4B7r783LQL1r=sw@mail.gmail.com>
Subject: Re: [RFC 0/3] HID: logitech-dj: Dinovo keyboard fixes and improvements
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Sat, Nov 14, 2020 at 10:21 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Benjamin,
>
> Here is my patch series for the discussed Dinovo keyboard (receiver)
> support improvements.
>
> I've marked this as a RFC since it has not been tested with a Dinovo Mini
> (nor a Dinovo Mini receiver) yet.
>
> I have tested it extensively with a Dinovo Edge, a MX5000 and a MX5500
> keyboard. In case of the Dinovo Edge and MX5000 I've not only tested
> them against their own receiver but also against each-others receiver.
>
> Once you have tested this series on your Dinovo Mini, it is ready to
> go upstream.

That part is now done, so I guess we can push it upstream :)

FTR, the dinovo mini still works fine with this series. I have a weird
issue where the secondary button gives me a left click, but according
to the raw logs, this is emitted from the hardware itself and is the
same whether I am on hid-logitech-dj or not.


> The first patch should probably go to 5.10 as a fix in
> case someone pairs the Dinovo Mini with a MX5x00 receiver like the
> reporter of this bug did with his Dinovo Edge:
> https://bugzilla.redhat.com/show_bug.cgi?id=1811424

OK, then I can apply it on top of the previous fix. I guess we don't
need stable@vger.k.o for this one?

>
> The other 2 are 5.11 material.

If I have to break the series, I will have to wait for Linus to first
merge the 5.10 material, then I'll be able to apply the others on
top...

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>

