Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D683172FE18
	for <lists+linux-input@lfdr.de>; Wed, 14 Jun 2023 14:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244032AbjFNMNc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 08:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244146AbjFNMMx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 08:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688A2213F
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686744713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FLmEY5G+jeEh/GDoafPE2Bh4OLm7hUTxCiket7t1C8Q=;
        b=edP7XqqCP/Ogt19J6gvnvXTdX3ApQ680gFWWF2Qa6pQt6dn+8xjKUFo/Kn7HvsVe2QdWet
        yqZcqaA19EvKDarJ9ZTIM7PPVKzfPaTdqt09c7+61CyYwO8CaWcZaH6DcsDd7l5Nr+qiui
        eT7OeKr7ry1u9uUb1VHjG90RZXYhFaY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-mqMe_nHENS-Pw2OFq83vng-1; Wed, 14 Jun 2023 08:11:52 -0400
X-MC-Unique: mqMe_nHENS-Pw2OFq83vng-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30fbaeec4c1so2447102f8f.0
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 05:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686744710; x=1689336710;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLmEY5G+jeEh/GDoafPE2Bh4OLm7hUTxCiket7t1C8Q=;
        b=j+qCaAEUuXy9NT/tF2oIKQQjFhEQHQYvyFSBSgrWLaiPvtCiELZcswoyCIh9kjBSMl
         Gnwuu6lR/TD7Yn2FW24pCTvGytqknrGK6jRRx72nTCIFgSM2FM6/8ylLUM+4pLGq0u7B
         wfRuu6sr7qlpWztGHvT49vwH8+f+HJsIEKb++4b5zWX4IdTvghidkA/QiH+hL6nNuO8z
         ZpYEFt0dp65GgjQXWEwJcQkEQOp9soSlz0A6k7YP+E1KBhq0JIs6nnGl7VcvjwTqHhS8
         PneGkC1l4wunFYhe9O1rx5tfxFBCY+74NfniJicoLE/8ca4bAoBQK2Hz2KFofDX9KW+w
         dN5Q==
X-Gm-Message-State: AC+VfDx+AFCcusvCGYOF1VAvMk5qycCVLF5MhE9nN6Jx/REKluAvOOSh
        6IqhIKx9DELk0tom0numXrGVQdGBseBK/3fLg93Vgk55NkVCEst0XREm5aZNFnfuXNDrgPS3ZzB
        7qQ1zn3cKjSc41HVm02DsYzxV5DnhZ8M=
X-Received: by 2002:a5d:4704:0:b0:30f:d14b:a806 with SMTP id y4-20020a5d4704000000b0030fd14ba806mr2707714wrq.63.1686744710585;
        Wed, 14 Jun 2023 05:11:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7x3UY7fK+oBso4szcxaV8IETHbZaAhlpYozg3rVC8cOz7oXElAS1ONTM89Vt1BrXWo7JWXGA==
X-Received: by 2002:a5d:4704:0:b0:30f:d14b:a806 with SMTP id y4-20020a5d4704000000b0030fd14ba806mr2707703wrq.63.1686744710265;
        Wed, 14 Jun 2023 05:11:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id v16-20020adfe4d0000000b00307a83ea722sm18140026wrm.58.2023.06.14.05.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 05:11:49 -0700 (PDT)
Message-ID: <68b1415c-1e27-5ee6-9514-e65f94500a9e@redhat.com>
Date:   Wed, 14 Jun 2023 14:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Tree dumb questions from an occasional
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
References: <5673fd15-b3f2-7911-6eea-39e5126f4874@polimi.it>
 <CAO-hwJKNqosABrr-VGSUVPs8CKRpQNTL0xgNLeT4yg453ADWZA@mail.gmail.com>
 <cce96d0b-1642-bf52-b9e6-64e40e8ae275@polimi.it>
 <CAO-hwJKvO3PLpDYBNE0PvVns3UaAzZJ1Xp3EHgDTBd+a_EpJwg@mail.gmail.com>
 <c2c116cf-56e7-12e3-f0e7-f726a0f3f0da@polimi.it>
Content-Language: en-US
In-Reply-To: <c2c116cf-56e7-12e3-f0e7-f726a0f3f0da@polimi.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED,URI_DOTEDU autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Wed, Jun 14, 2023 at 12:18 PM Marco Morandini <marco.morandini@polimi.it> wrote:
>
> > Actually, the one place where it would make sense to have such dynamic
> > quirks is in the hid-core (hid.ko) module itself. It would make sense
> > to have a BUS:VID:PID:QUIRKS parameter.
> > But having such a parameter is not without constraints, because it's
> > not really "dynamic", and we can only set a limited number of quirks.
>
> Ok
>
> >
> > In your particular case, we might as well use an HID-BPF program that
> > tweaks the report descriptor which would force the kernel to "use" the
> > multi-input quirk.
>
> If this means that it could be a nice example (something you would put in
> samples/hid) for HID-BPF, this would be great
> (and I would be curious to understand how to do it).
> But don't waste time for me: the patch is already in your
> for-next and for-6.4/upstream-fixes branches, and for sure I can wait
> and deal with what I have right now.

The program is actually simple: knowing that the kernel splits by
application collection, we can replace the second collection from being
exported as a mouse into a pointer:

See the branch hp_elite_presenter of https://gitlab.freedesktop.org/bentiss/udev-hid-bpf/-/tree/hp_elite_presenter

The program just replaces the byte 79 from 0x02 (mouse) to 0x01
(presenter):

---
SEC("fmod_ret/hid_bpf_rdesc_fixup")
int BPF_PROG(hid_fix_rdesc, struct hid_bpf_ctx *hctx)
{
	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 4096 /* size */);

	if (!data)
		return 0; /* EPERM check */

	/* replace application mouse by application pointer on the second collection */
	if (data[79] == 0x02)
		data[79] = 0x01;

	return 0;
}
---

>
> > Would you mind attaching the output of hid-recorder while you do some
> > HID events and where you show the bug?
>
> Attached; I've tried to use all the mouses/buttons. Do you need the same
> kind of recording taken with the patched kernel?

Nope, no need. hid-recorder is what comes from the device, so the kernel
processing depends on my current tree, which explains how I can test the
various quirks :)

>
> You'll notice that the HID descriptor advertises two mouses and
> two consumer controls, each with different Report IDs.
> This is because this device can be used in two different
> configurations: one is a traditional mouse, that you use on your desk.
> If you turn the device, then you access the second one,
> where you are dealing with a virtual pointer:
> two gyroscopes sense the change of attitude of the device,
> and you can control the cursor by waving around the pointer.
> The buttons that you use in the two different configurations
> are different as well.
>
> > Also, FWIW, the number of MULTI_INPUT quirk required in the kernel is
> > probably a sign that we are not using the best default implementation,
> > and I've already been pinged to change that. I couldn't find the time
> > to get back to this, but your device might also help me in having a
> > broader range of use cases so that we can ditch that quirk once and
> > for all.
>
> I was clumsy looking around trying to understand why it's better
> not to have it as a default, but for sure there are good reason
> for the actual behavior. Perhaps this has to do with the fact that
> you don't want to have duplicated OUTPUTs (if there are any)?
> e.g. https://lkml.iu.edu/hypermail/linux/kernel/0701.1/1132.html ?
>

IIRC it was mostly because some devices were having separate
declarations for their input/output and features, and they were not
especially grouped together. The multi_input quirk splits features/input
/output in different devices, making it harder to configure (in case of
the multitouch ones, where to need to set an operating mode), and the
default was just having one input node for the whole HID device.

Cheers,
Benjamin

