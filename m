Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C08D78443
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 06:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfG2Emz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 00:42:55 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41812 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfG2Emz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 00:42:55 -0400
Received: by mail-qk1-f194.google.com with SMTP id v22so43247357qkj.8
        for <linux-input@vger.kernel.org>; Sun, 28 Jul 2019 21:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ush9HrXyaMyVS86ugCGUrLtdIBBVnnHML8k/0je9fuI=;
        b=nI8btXEC6jALpy/mZB0PYTJzUe1barBEEArh/yLp9rYUnpH7ZwPzYskrfMdoMZi3p6
         YEoH0C5J3xxhxSGBOVrgB9zpJS0P9GLgQC64UCVOywGsGysuYft2LPRyvRgAjf7Y4RDd
         1GMGlyMxgD0fiGScVawD45gKVCN0h+yBprhRf2UTL0gkqtHSLE1iI/L4NvyJAUx1zhYi
         D9RhB80npYVNk15ybtoZ8cdPqSdkzwy7sNhACIYJqcY7qWjfvF7FUSWMsEthGDnrrBte
         zv6IX44mjdi0pTtCwa3GQWkK4iUWhOaRIhmB1JM67099QUBOvnauhPGWfp16q+BFXUkU
         3FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ush9HrXyaMyVS86ugCGUrLtdIBBVnnHML8k/0je9fuI=;
        b=QbOiB2duFaZvGbDi2NIsc6SdBec8Q1TjOPvUY9twndeQ+OGuqu0jCWt7IkQ1oNFw+j
         BC8GwQjpj7HTi64Tpn5m+6BcLLTSTTGCmxSySJ8iCrt89CcJP/TqWHlqVXFpV7R3l53r
         bpL16AdGJD8ygiml+VHFcxQmKt1l6rruHeq71KWpJa0+D/uDGQzWIsSAWV81/YY2GPvM
         xMGvJklNVnHlH1EWa9+q8jqWVuzZWa4KwqUuTcDCfdUwxf+lrT8gK9lgpwVSKa6VzF/A
         GeFbPz2UDWYVYFQfIK3GcUldvYaJsNKXB8klLyRuZOlLErEXGOb6ySMiff2gUqvCTOZa
         g9QA==
X-Gm-Message-State: APjAAAVttSZQ8oBILpU8eTARfiWtg9tW3yUYDrW08+zxifOzsGIk4Ifk
        ado+joxn2UEs+ImKXnLieAEu5Y1qJQv25/PMP6o=
X-Google-Smtp-Source: APXvYqwbGnIMbYFIuNXzoNv9cMswfH7yUmqCQ3+b0YpdoYmpBQ14xVCIPGEe7RIPUilt7xCRKXSvs/wm8IXidBdkhVE=
X-Received: by 2002:a05:620a:1017:: with SMTP id z23mr73636065qkj.60.1564375374228;
 Sun, 28 Jul 2019 21:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <6b611ae9-a4b4-d456-2a44-dc9d00140a68@hanno.de>
In-Reply-To: <6b611ae9-a4b4-d456-2a44-dc9d00140a68@hanno.de>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Sun, 28 Jul 2019 21:42:43 -0700
Message-ID: <CAEc3jaAzSPwr40PGig=vBk+SC67npoB77Me-x9COgNePzsNRxQ@mail.gmail.com>
Subject: Re: Question about gamepad trigger axis values: Is -32767 or 0 the
 correct resting position?
To:     Hanno Zulla <abos@hanno.de>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 26, 2019 at 2:04 PM Hanno Zulla <abos@hanno.de> wrote:
>
> Hi there,
>
> during a discussion of a Retropi issue [1] a question about the Linux
> kernel gamepad spec compared to the actual gamepad drivers came up.
>
> The spec says in [2]:
>
> > "ABS trigger values start at 0,
> > pressure is reported as positive values."
>
> The kernel drivers for the XBox 360 gamepad, for the Sony Sixaxis PS3
> gamepads and other drivers based on their example (like the BigBen
> gamepad) however return trigger axis values with a value range that...
>
> - starts at -32767 (trigger resting position) and
> - goes up to +32767 (full pressure on the trigger)
> - with 0 being the middle position (half pressure)
>
> Please clarify, is the spec wrong or are the drivers in violation of it?
>
> If they are in violation, which should be changed, the spec or the
> drivers' behavior?
>

Well some of the drivers are kind of in violation. The spec itself was
added in 2013, while many of the devices or drivers are way older. The
spec also states:
"Legacy drivers often don=E2=80=99t comply to these rules. As we cannot cha=
nge
them for backwards-compatibility reasons, you need to provide fixup
mappings in user-space yourself. "

It is very, very hard to change the behaviour as it would break
applications. (We actually went to this once for ds3 / ds4, but that's
also because the driver was very incorrect and using illegal axes
even. Was a huge pain..)

We should pay attention to new drivers to support the spec as best as
possible. For devices which just use the generic HID parser ranges can
still be negative/postive for triggers, though mapping might also be
off then.

Thanks,
Roderick
