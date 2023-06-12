Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F42572C584
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 15:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjFLNIP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jun 2023 09:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjFLNIO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jun 2023 09:08:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3E0B1
        for <linux-input@vger.kernel.org>; Mon, 12 Jun 2023 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686575249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q/MiI9QXiK+kGw2VuWEMjDPg8aH3Xvd+G1TkY8ef5uQ=;
        b=cZyYZNghWlB18OiQNn0/JkGPiVaJGlYIdVrEBb04+qWVQkn/wH/Ja/U/FoTQNbgo6QccyB
        n79gaMVFbJ4AgVUSJsfceaKoh4zi9dkiydT7xx3Aj0r3d+l5RJlwB+dzuk1JOLfv2vtIQ4
        QAJvQbs0aa1IunJKMyQLowirispYyb8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-P7HD4ILnNvG7TkaoWUq7iA-1; Mon, 12 Jun 2023 09:07:27 -0400
X-MC-Unique: P7HD4ILnNvG7TkaoWUq7iA-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6b2c801ac6cso2745331a34.1
        for <linux-input@vger.kernel.org>; Mon, 12 Jun 2023 06:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686575247; x=1689167247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/MiI9QXiK+kGw2VuWEMjDPg8aH3Xvd+G1TkY8ef5uQ=;
        b=BCE50qHw2HVjI9cVCv20aipSRLcMOb5HCrExm0sQPmXE3W0/7aoDvwDwN5OMzMeUBq
         l/wUW7chHK1RParkQ5hNc/xeIA0x2WeCODKjnvhnugG6KXAInfNFU5DkmTUYTCI3aaIl
         UjjfP5aYdNHtjFxkLu3c4zG/A8fDYurFYaLuwhMhPnh9UPRZ6O+kkVrQmmlqUuE748gn
         q+o+WmIQNmGiQqHgkKELa4cxdo/932vpFzJF9cxwcE6//l20dIejbUirZUOTp1uZ+bf0
         2doqYrHUVF7DGQ5MhRncEO4N/AXfR0+5l4d9Y1NgvfYVX6tcNiUb51m0eHPahLT3RAxc
         iezg==
X-Gm-Message-State: AC+VfDzosBvNnFBAF1xy3T4kWjb5b3A6MQcb3tNRW+w4uSDa/TnCGloJ
        FEdgz61zqpZJzqC1PI+8EDoWpdm+e3tO9D8h13WJkbt31oVLNGWWcq77eOB1zFLEaH37RrTsv3l
        aO7PXS4Ae+EgFU6FLABYpD6uVXs4U2NMeCRQJJJY=
X-Received: by 2002:a05:6830:1312:b0:6b1:6cb5:f704 with SMTP id p18-20020a056830131200b006b16cb5f704mr6321165otq.1.1686575247017;
        Mon, 12 Jun 2023 06:07:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44nt1oEoMTHGETcXQ9agWXqZJNAxv/1SAonjkGFyWybxdBPjmV4E3Q9MlSrNOhmReZlMk+SLDpqbrL0Ywjwrk=
X-Received: by 2002:a05:6830:1312:b0:6b1:6cb5:f704 with SMTP id
 p18-20020a056830131200b006b16cb5f704mr6321140otq.1.1686575246678; Mon, 12 Jun
 2023 06:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <5673fd15-b3f2-7911-6eea-39e5126f4874@polimi.it>
In-Reply-To: <5673fd15-b3f2-7911-6eea-39e5126f4874@polimi.it>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 12 Jun 2023 15:07:15 +0200
Message-ID: <CAO-hwJKNqosABrr-VGSUVPs8CKRpQNTL0xgNLeT4yg453ADWZA@mail.gmail.com>
Subject: Re: Tree dumb questions from an occasional
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,


On Mon, Jun 12, 2023 at 12:29=E2=80=AFPM Marco Morandini
<marco.morandini@polimi.it> wrote:
>
> First of all, please bear with me for writing this.
>
> Should this appear email to be a criticism toward any of you,
> be assured that this is not the intention. I'm
> really grateful to all you guys, who keep improving the kernel
> and allows us to use a free operating system.
>
> My questions here below are basically along the lines of
> "would it make sense to write this and that?". This is not
> because I'd like someone else to do the work for me, but
> because I really don't know whether it makes sense or not.
> Should be wrong to make such type of questions without
> accompanying proofs of concept, then please ignore me, and
> I'll go back into my cave.

Asking questions is always fine. And given that you already did a lot
of homework, not answering would be rude ;)

>
> Some background: I've recently bought a laser digital pointer
> from HP. It connects through Bluetooth.
> Since it did not work, I made a point to have it working,
> even if I'm not a kernel developer, and do not plan to become a
> kernel developer.
> At the end, this turned out to be a two-line patch, adding
> the HID_QUIRK_MULTI_INPUT for such device. Something that
> would likely require less than 5 minutes
> of a not-so proficient kernel developer.

Yeah, right. This is the kind of situation where it's usually easy
enough to detect with hid-tools[0]. We can record the device on your
machine, then we can replay it locally on ours, and make several
attempts.

>
> However, the process for me was much more cumbersome:
> I had to navigate a lot o wrong or misleading documentation
> in different forums, try to make sense of the kernel documentation,
> understand what a HID descriptor is,
> understand how to parse it, try to make sense of some
> unknown kernel code (mostly unsuccessfully),
> try with ebpf, try this and that... you get the idea.

Heh, you tried hid-bpf :) thanks!

>
> Now, I'm writing because I _think_ I've learned something
> in the process, and perhaps it could be useful to share it.
>
> Thus the questions:
>
> 1) do you think it would make sense to have some basic documentation
> describing what a hid descriptor is, where to download the documents
> defining it (https://www.usb.org/ is linked from the docs,
> but this is not enough to get started, at least for someone like me),
> how to actually read it from the hardware, how to parse it... ?

Yes, very much yes. At least having pointers to various projects that
can read HID descriptors and parse them would be already better.

> Very basic things, that, if I'm not wrong, are not currently
> covered by the kernel documentation, and that could allow
> someone else like me to get started more quickly?
> If yes, I can try to write a skeleton for that, but I'm not sure
> there will not be errors and/or omissions, thus it would likely need
> to be fixed by someone more knowledgeable than me.

Sure. Please write (if you want) your first draft, we can review it
and we can iterate from there. Do not forget to add the linux doc
mailing list in CC in case some people from there want to also add
things.

>
> 2) if I got it right, one can add a quirk like HID_QUIRK_MULTI_INPUT
> while loading the usb_hid module, but not while loading the usb_generic
> one (that turned out to be the module that manages my HP pointer),
> even if the statically defined quirks were moved into their own file.
> Would it make sense to add the possibility to
> add quirks while loading hid_generic? Is this the right place for
> such code? If yes, I can try in my spare time to do this,
> even if I'm not sure I'll be able to get it right.

I'm not 100% sure of what you mean, but currently dynamic quirks can
be added to the *usbhid* module (not usb_hid or usb_generic), which is
the transport layer driver for HID.
This module is responsible for creating a HID device, which can be
handled by HID drivers, hid_generic being one of them.

As the name says, hid_generic is supposed to be generic, and I do not
want to see special cases handled there, because it would not be
generic anymore.

However, other drivers, (hid_multitouch for instance) can have a
.driver_data dynamically set too, which allows for quirking a device.
But the quirk is local to the driver.

Given that HID_QUIRK_MULTI_INPUT is a global HID quirk, it makes sense
IMO to add it at the usbhid level because you are just using the
hid-generic implementation.

Furthermore, if you submit your patch to the LKML, the quirk will
likely end up in driver/hid/hid-quirks.c which is exactly the static
equivalent of the dynamic one from usbhid.

So I don't think having such a new quirk mechanism makes sense.
Furthermore, that quirk mechanism allows for quick and dirty testing
of the impact on the kernel, but a proper submission as a kernel patch
ensures that everybody gets the same fix, so I'd rather not have a
forum that explains in details what to do for a given HID product when
we can just quirk it in the tree and forget.

>
> 3) always if I get it right, currently it is not possible to inject quirk=
s
> using ebpf, but only to modify the HID descriptor.
> Is this correct?

You can also change the events and filter them out if you want, but
yes that's pretty much the extent of HID_BPF nowadays.

> If yes, do you think it would be feasible and reasonable
> to add such a  possibility? If yes, I can try in my spare time to do this=
,
> even if I'm not sure I'll be able to get it right.

Long story short: I would rather not have such bpf call.

The fundamental of HID-BPF is that you take a HID thingy, and you
output another HID thingy. Messing up with the kernel drivers is out
of the scope.

But furthermore, what would be the benefit compared to the already
available dynamic quirks the kernel allows to have? You can simply add
a configuration file to your system to locally have the dynamic quirk
set, and then it gets re-applied on every reboot.

As much as I'd like bpf to be the universal answer, this doesn't seem
to be a good replacement to what we currently have.

HID-BPF seems to be a good answer to replace (some) drivers, but I
don't think it should replace the generic kernel processing. So that's
why I don't think this is a good idea.

>
> Apologize again for this long email:
> I understand it's full of good intentions but without any
> significant contribution :(

No need to apologize. You are actually proposing ideas and your help
to make things better for end-users, which is extremely valuable in
itself :)

Cheers,
Benjamin

[0] https://gitlab.freedesktop.org/libevdev/hid-tools

