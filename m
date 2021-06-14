Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B4F3A65EF
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 13:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbhFNLqI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 07:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28145 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236923AbhFNLoq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 07:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623670963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sGJ+5mK+OL6ymk+vggAU+0NCWbyk8aK+nFqaiUWF+ME=;
        b=POdtKvHP5u8RFNeKNVbZQdTxbd5Jj8Kp1TGeHeDje3WHt8s5hqqjCzvRvxJ2mEAKJyxUBj
        F+r8z9asbes3rVXNEZwk3/QbQ19foz5+linWW+JwvuRedNGFqjsfzhzwWKES/GAr3NEslk
        krrK8MeqJ9I/RHLaFGPILz79/BLg4EE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-029_3FGoNqSS0pzZ41DLkw-1; Mon, 14 Jun 2021 07:42:43 -0400
X-MC-Unique: 029_3FGoNqSS0pzZ41DLkw-1
Received: by mail-ed1-f70.google.com with SMTP id s25-20020aa7c5590000b0290392e051b029so15091297edr.11
        for <linux-input@vger.kernel.org>; Mon, 14 Jun 2021 04:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sGJ+5mK+OL6ymk+vggAU+0NCWbyk8aK+nFqaiUWF+ME=;
        b=AUvROKFa1m9CEJNdFpZKkHuaIhj8r3wbb9w+29+ds6uLZ+CzLcqCJRvxZUzxkuuPFV
         /jqtw0+oHmnYPp3r7A25fj4CuLUp8aGIUM3MC2lWumT1bv86CqSjQuop8tWWh71jM1r7
         tELDmj+ncW3zm3JVyVTDhR9OHlztp3a/04a6aalqDm46C6EpXoMFGkt4rbFruzlEiW3Q
         fGLgKk/XVG66MITY34B4af5nwPLwmC8UOK8jqbmVviJkf0rv8uAOFB6tR/IHTWejrJMN
         ZKDVdIiaVjzGBbXY2ngysGi67a4zUfmpEKmxnYSpGJExcEWDjKho95oEHLEMD2GlYCAl
         rvZg==
X-Gm-Message-State: AOAM533iBT7/P25NTEsXXJLXtlkILmBTRGAI/ZJzMa+S+GjfH03aK4As
        R6OcpfzNf9D8WAnDZX1W4r7yc5wO4HnEL8fvGIhkriEHI+4BxQIGM6IeupQGoCOQ+gpAtAdEkIr
        EZjTibst/vylY9mVoiBnBDSLzYxpHzra+K2Jyirgm1uU6hiNkzVjzDT55myYl8WBkNAlaFYeQ4s
        Q=
X-Received: by 2002:a17:906:4111:: with SMTP id j17mr14691191ejk.488.1623670961613;
        Mon, 14 Jun 2021 04:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSzXxVmUuRH1CjVH8/FNAZ7EhtcoqhfkOs1UtjCnm4OaFN3R1nV0ca0fR8rTE34VQY94HUmA==
X-Received: by 2002:a17:906:4111:: with SMTP id j17mr14691172ejk.488.1623670961332;
        Mon, 14 Jun 2021 04:42:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b24sm8593170edw.4.2021.06.14.04.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 04:42:40 -0700 (PDT)
Subject: Re: [PATCH 1/3] Input: touchscreen - Extend
 touchscreen_parse_properties() to allow overriding settings with a module
 option
To:     Gregor Riepl <onitake@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20210613102158.16886-1-hdegoede@redhat.com>
 <20210613102158.16886-2-hdegoede@redhat.com>
 <be664f7551029705030188f446799e1ff9ad9e03.camel@hadess.net>
 <278c2a63-2f7a-3fc4-24cb-fea8cb0d7e21@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <daab7a9d-4cd4-f72d-d306-2abcf1adf491@redhat.com>
Date:   Mon, 14 Jun 2021 13:42:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <278c2a63-2f7a-3fc4-24cb-fea8cb0d7e21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/14/21 11:16 AM, Gregor Riepl wrote:
>>> Add a new, optional, settings_override string argument to
>>> touchscreen_parse_properties(), which takes a list of ; separated
>>> property-name=value pairs, e.g. :
>>> "touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-
>>> x-y".
> 
>> I haven't reviewed the argument parsing code, but eep. If this were
>> user-space code, we'd have exported it and tried to feed it all kind of
>> garbage to see whether it parsed things properly, even if it's only run
>> on the author's machine. Can't say that I like it.
> 
> I'm slightly surprised there isn't already something in the kernel that
> can be used for such module argument parsing.

There are some functions which can parse a key=value string, but they
mostly iterate over the string, they don't really build a dictionary struct.
So you are expected to have this while processing the key-s one at a time,
where as the drivers/input/touchscreen.c code is using device_property_read_foo
calls which would require using a dictionary in between.

Also these helpers are hard-coded to use comma as separator, which does
not work for driver specific properties like "silead,home-button" and also
they all expect there to always be a =value which is not how boolean
properties work in e.g. devicetree.

> Would it be possible to decouple the settings parsing code from applying
> them to the device completely? I.e.:
> 
> 1. parse the settings string
> 2. store all detected settings in a static (struct) or dynamic
> (dictionary) data strucure
> 3. apply device settings from DSDT/DT/etc., overriding the values that
> were passed through module options

If there was common, proven, code to do 1. and 2. already then this would
be a good approach, but given that there is no such code code this seems
like it adds a lot of code, which will likely introduce quite a few bugs
since it will all be untested new code.

> This is probably less efficient, but looks more robust to me.

How would this be more robust, this would require adding a whole bunch
of mallocs + frees, which introduces a lot of chances to get things
wrong where as the current approach is pretty KISS.

Given the way how device-properties in the kernel are already using
a module where the consumer queries them one at the time, extending
this to also query an extra string provided through a module parameter
is a natural way to extend this.

Also I notice that both you and Bastien are weary of the robustness of
my parsing code, but it is pretty simple and straight forward code,
which does not make any changes to the input string at all.

It could definitely do with a second pair of eyes taking a goo
critical look at it. But AFAICT it actually is pretty robust and
since the KISS way how it integrates with the existing parsing
code, the overall solution, even though not very elegant does
seem pretty robust to me.

> Or how about simply adding all supported overrides as regular,
> individual module options, maybe with a prefix? That way, there doesn't
> need to be any additional parsing code.

Doing this requires the following 5 lines of code:

int/char* property_foo;
module_param(property_foo, type, 0444);
MODULE_PARM_DESC(property_foo, "description ..... .... .... .... ....");

	if (property_foo_is_set())
		ts_data->prop.property_foo = property_foo;

For each property for each driver where we want to allow overrides.
touchscreen_parse_properties() atm makes 11 device_property_read calls, so
this would require the above code 11 times *per driver, which IMHO is not
a good idea.

Regards,

Hans

