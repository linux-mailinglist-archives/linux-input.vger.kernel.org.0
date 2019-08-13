Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56CB8B5E8
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 12:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfHMKuJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 06:50:09 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37658 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfHMKuJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 06:50:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id f17so35306497otq.4;
        Tue, 13 Aug 2019 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2F/cyp13A0IuHdjq2E+PIxCzbUQf5Y+nO9hEvaEw8c=;
        b=U9qr7mkH+zxRBYpLU7hxgwWbrgIBe2YS3lj8LGw2Y+bZQf4/bwGiH5JTVpMru1v9bi
         Gu2JEkoX1GWsMwfWTrG9CcZGyE4oY6qFZfrmnBal1NpCu/b7/fCmijLKzmJCFxGE0xDS
         gpS5/cYc5xo+fAp6X9ouRY+2ExMWM5vC29GjqhFIHDmkBQXvXL0upx3oLBd7czC7st4+
         k2HYEnkStxG3EJN/jxhRV1JX8zB8KbDeyeWm+zFcRopC2snzuQVf2CToXr+emDcU7yv2
         aiYu5c8dJekCR/1HrDqBmjSns9OsBNb14iFzuMhajiniB9JssWNhFFtmqneuUr2Cme9y
         YMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2F/cyp13A0IuHdjq2E+PIxCzbUQf5Y+nO9hEvaEw8c=;
        b=phtsT0F38wB0iZYw/xJ6NY0Kckp7Zz0G/gMhuatiYcuYGaRt6OKxy2ZNKntTyXd+Tk
         cPmXuytspkWOIC7joV8USA0537EveI23PkUfhDmJ9Ro27XULE7v7YTv4bfoM0CNdcmUw
         oqARRku2TFzXkA/FxuLxQF596+RBQTGSAg++2YdP94UXYIeB5VyJTGwa9CYnDi+E1lI6
         xYVUQC1BP0plLUI6pQ4oblmwWFh9SmXOfI5Ea6UHrcC157+lN3Pt6n3WN0gxT8/zuebK
         m5NAqwwETtlEAVxRnpQAOK8ksZm3WcreKvyoSxRD1JdiYjOcWbm2hORjmvnyM6U7lqtN
         4AEQ==
X-Gm-Message-State: APjAAAUxdc8D21cY8XJO9Lt5Bmt1Px0qqOCo7ffK0X7cE2Iu15kSIQjz
        ulYrHxJQ6gD8YMr4BqxtxcKer/lO5vKll/HdrlM=
X-Google-Smtp-Source: APXvYqwe3i+AZgF2ACcinBWaMb25B3ntGayqOqxX4C7FZUPoFL7dfvqAeq+HLMQyowXJhtcES3k1DkMgIZPIHbTL9MA=
X-Received: by 2002:a6b:2b87:: with SMTP id r129mr12216812ior.308.1565693408222;
 Tue, 13 Aug 2019 03:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190812162105.13428-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20190812162105.13428-1-benjamin.tissoires@redhat.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Tue, 13 Aug 2019 12:49:57 +0200
Message-ID: <CADyDSO4x49GWdRVkW=cytvMc7rM3NJkJ4-Sj-FjM9Gday7C-iw@mail.gmail.com>
Subject: Re: [PATCH] HID: uhid: actually use the err number from userspace
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey

On Mon, Aug 12, 2019 at 6:21 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> This can help debugging the situation
>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---
>
> Hi,
>
> not entirely sure if we can use this in a such simple way.
>
> However, this is useful to mimic device behaviour from userspace.
>
> Cheers,
> Benjamin
>
>  drivers/hid/uhid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/uhid.c b/drivers/hid/uhid.c
> index fa0cc0899827..2fa32e7fc733 100644
> --- a/drivers/hid/uhid.c
> +++ b/drivers/hid/uhid.c
> @@ -284,7 +284,7 @@ static int uhid_hid_set_report(struct hid_device *hid, unsigned char rnum,
>                 goto unlock;
>
>         if (uhid->report_buf.u.set_report_reply.err)
> -               ret = -EIO;
> +               ret = -uhid->report_buf.u.set_report_reply.err;

I am generally in favor of this. But:

1) can you do this for both set_report *and* get_report?

2) I think you have to filter some of the error codes. For instance,
if you return one of the -ERESTARTSYS codes, this might cause the
syscall to restart (if auto-restart is enabled on this context). At
the same time, this is not *that* bad. It might even be useful for the
userspace driver to trigger an EINTR. At least we should be aware of
this. So maybe filters are not necessary.. Mhhh. Comments?

Thanks
David

>         else
>                 ret = count;
>
> --
> 2.19.2
>
