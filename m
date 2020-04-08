Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E73D1A276B
	for <lists+linux-input@lfdr.de>; Wed,  8 Apr 2020 18:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgDHQpY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Apr 2020 12:45:24 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:34900 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgDHQpY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Apr 2020 12:45:24 -0400
Received: by mail-ed1-f52.google.com with SMTP id c7so9490674edl.2
        for <linux-input@vger.kernel.org>; Wed, 08 Apr 2020 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=v1UqV++4X28rjesCpJrgr5iLOyryK0/uLrtmJ+okwzs=;
        b=i7SXoYBNmL4/BdqKGA5wc9wwE2faViPmm8ouN642ZZyVjOgBCqst//pfC6r1oH28f2
         s0n7a8YvdI8kilA0bjrhmd6nu7mZcf8BLBMr2pXXxActTFeAtQz4FKn8upCOmyOygqXm
         QJQTQwftvnDxv2mAkApovVq9/VcL6S7/WFKLcKaeE+IZsEN1duCWRlNdoqVb10MpbrcH
         Ki2JLP+yMMod5YegAME0wmcnpGb868EyPudwsNju0krVrUtiuZNe4/Sjcb6CyBYxP8oI
         Xo6HVeeWQHrcqrdZd9UBTtj8GJVQJlxLv/G5PVMfQQWrQ3VbcbVQBp1o86HENDrIuapc
         HHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=v1UqV++4X28rjesCpJrgr5iLOyryK0/uLrtmJ+okwzs=;
        b=fTE8v4KY69NYlEX2p/0MJjkrae6DNSBHaEa4DYP33pWzFdTXe3kikNWftEOqZmwfJH
         /ysRO7DShUdAIYiWp2YXw3pd0OmDAx+/FlnZX4ekVaCpiiwXpkmHa+mXc8+//PAW54Zv
         m9KvK4xe3s2GYsHkLdIn2CE0sYL02xhFd0F16l+yGcOyNrNIs6/LxX3tP29Sg6fZ0Icj
         FWDMeXXZq5rLt5CnPfSXB+Z5hy1hS5n7cFTPk2b+XPloRcpk0qM0u3FHd0FsrKvE02/B
         WimijCaGLXrgaWhG7fnYoCS8r/zIgQJNnv8g3GJkvM4phB2OMpbkixthUp6wwaU6fQad
         +Fqg==
X-Gm-Message-State: AGi0PubPzH9NUAJ8lW5jTh54SmNX6wGXatnMh9J0KH6KwkOJrhQ5hky/
        Ehqr5LBal3qJUxuDLEgMtq+DfzH8mNlTpw9RRG1XSQ==
X-Google-Smtp-Source: APiQypIsbzQvMOGdUwRrLm3nk5eO6zVJGvc3/t2rqjlvWgNHoW4D1pBf7t3xWcHIfRnHCFtEjn7Prr26uLe10nKmlKg=
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr7238536ejx.305.1586364321327;
 Wed, 08 Apr 2020 09:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
In-Reply-To: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Wed, 8 Apr 2020 09:45:10 -0700
Message-ID: <CAKF84v1yRUjvxdWUNXdKXFQw7=9rjR0+pwvXP1ORjq5JEijc4g@mail.gmail.com>
Subject: Re: behaviour change for keyboards introduced by "HID: generic:
 create one input report per application type"
To:     Garfield Tan <xutan@google.com>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin and Jiri,

Could you provide your thoughts on this?

On Wed, Apr 1, 2020 at 1:02 PM Siarhei Vishniakou <svv@google.com> wrote:
>
> Hello linux-input,
>
> We have noticed a recent behavior change introduced by the commit:
> https://github.com/torvalds/linux/commit/f07b3c1da92db108662f99417a212fc1=
eddc44d1
> HID: generic: create one input report per application type.
>
> We have been looking into the behaviour of the Microsoft Designer
> keyboard. Prior to these patches, the keyboard would report as a
> single input_device to the user space. After these patches, the
> keyboard is now split into 2 input devices: =E2=80=9CDesigner Keyboard
> Consumer Control=E2=80=9D and =E2=80=9C"Designer Keyboard Keyboard". We n=
oticed that
> this behavior also applies to the keyboard Dell KB216. In the Dell
> case, it is split into 3 devices, which include =E2=80=9CConsumer Control=
=E2=80=9D
> (for some of the media keys) and =E2=80=9CSystem Control=E2=80=9D (for th=
e sleep
> button).
>
> In both Microsoft and Dell cases, these are pretty standard keyboards,
> although they do contain media keys and power/sleep keys.
>
> Could you please confirm that this new behaviour is indeed
> intentional, and that you wanted keyboards to be split in this
> fashion?
>
> Thanks,
> Siarhei
