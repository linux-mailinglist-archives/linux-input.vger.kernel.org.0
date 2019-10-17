Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1173ADA7BB
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393312AbfJQIs3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 04:48:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23740 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2408336AbfJQIs2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 04:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571302107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P23yKEodgmnfGUw9sfhLwiVnwWH7sPsG4YJ+YL5V5tM=;
        b=BHpI7kcCFE68wmEeHhoFu5d2FYI8RXb5/9hF4wI0CaUhSH4pUja7+lWDPsbUWSlVmxEOhO
        aQbo7RksZqUeex+y77UPIGxUXoNgOGFT/if3nJAciKyG9mCYGiOME4lqC+irMOF3SkIqM9
        zqY5fZVlMyuQ5MrhyFKCsFCPO6b0uQY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Sdp8LvH0PHW4mOSU1AdGaA-1; Thu, 17 Oct 2019 04:48:23 -0400
Received: by mail-qt1-f200.google.com with SMTP id t25so1613418qtq.9
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2019 01:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ITrwUcZNhHdbR5/yJdBac5vGGHSYPWf4FBJkw33BU+U=;
        b=UqVgOEiV3qdgaSS7qOE97+6EWc9T6XXUDfdMhV3Adzma2dmiqdLBwl429a4CZvB1XJ
         jpzyAj/56VpPsBtLq1nrko0rfk2bdzh4yCnv6D/5PfYZhcv+Ap4AJ3aGLERlH3+EiW/B
         BRlqhc9PXQp3cWnarNZ9fD6N6h3RoiJadNoHYp9YQKZgqnQK0qev0UN3b9PMSbht08D+
         qVUIFQhTQ652NjZMXNRBdKYsQE+GiD8N8WyroffQASIpE34QrNEaOV049fWK5qW7y2da
         7x66cA03HskEV6d7dTLu8FBWElsUc20S7uojIFCcET1DVaYA9jKT/YVGOCqxdOzMjLnx
         uX6A==
X-Gm-Message-State: APjAAAXwIh+Ti7tCPVPEVUtd9K5mgZRuJnL/fVCjMMiqsueZVIc2OABF
        H4tlNHRMT8HrnRX9T9lm4GU0W3SP9Ma4vzl2XTmqNuwnOIEZe4mNzADvy8pEtKWw1yHXqn6FQ68
        7erFy8z3WofvVq/C/9CJrha85/r/xG5jVBTaqLOA=
X-Received: by 2002:ac8:38bb:: with SMTP id f56mr2664257qtc.154.1571302101137;
        Thu, 17 Oct 2019 01:48:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6KHex7FZUFA1EICrnIh9zS+/BKcB7zS+GZg/tObmOEO5bLx2+4/yRRVT89C+jjp59lTtx3kazw3v1B4kfIfg=
X-Received: by 2002:ac8:38bb:: with SMTP id f56mr2664246qtc.154.1571302100911;
 Thu, 17 Oct 2019 01:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191016182935.5616-1-andrew.smirnov@gmail.com>
 <20191016182935.5616-3-andrew.smirnov@gmail.com> <CAO-hwJ++YWtX29YefGzaEfCLDA=npZwUxDCkDzxALAmLLqv7FQ@mail.gmail.com>
 <CAHQ1cqHcm2z4dTJ-3kx-_e3_1mpz9x_AQ+GP_j-nqL=3Gm-AtQ@mail.gmail.com>
In-Reply-To: <CAHQ1cqHcm2z4dTJ-3kx-_e3_1mpz9x_AQ+GP_j-nqL=3Gm-AtQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 17 Oct 2019 10:48:09 +0200
Message-ID: <CAO-hwJJ8EJOtYYrsvh=bZKmMisRUADO-w6G7QRSGXe_-cdobUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] HID: logitech-hidpp: rework device validation
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Sam Bazely <sambazley@fastmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
X-MC-Unique: Sdp8LvH0PHW4mOSU1AdGaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 16, 2019 at 9:38 PM Andrey Smirnov <andrew.smirnov@gmail.com> w=
rote:
>
> On Wed, Oct 16, 2019 at 12:24 PM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi Andrey,
> >
> > On Wed, Oct 16, 2019 at 8:30 PM Andrey Smirnov <andrew.smirnov@gmail.co=
m> wrote:
> > >
> > > G920 device only advertises REPORT_ID_HIDPP_LONG and
> > > REPORT_ID_HIDPP_VERY_LONG in its HID report descriptor, so querying
> > > for REPORT_ID_HIDPP_SHORT with optional=3Dfalse will always fail and
> > > prevent G920 to be recognized as a valid HID++ device.
> > >
> > > To fix this and improve some other aspects, modify
> > > hidpp_validate_device() as follows:
> > >
> > >   - Inline the code of hidpp_validate_report() to simplify
> > >     distingushing between non-present and invalid report descriptors
> > >
> > >   - Drop the check for id >=3D HID_MAX_IDS || id < 0 since all of our
> > >     IDs are static and known to satisfy that at compile time
> > >
> > >   - Change the algorithms to check all possible report
> > >     types (including very long report) and deem the device as a valid
> > >     HID++ device if it supports at least one
> > >
> > >   - Treat invalid report length as a hard stop for the validation
> > >     algorithm, meaning that if any of the supported reports has
> > >     invalid length we assume the worst and treat the device as a
> > >     generic HID device.
> > >
> > >   - Fold initialization of hidpp->very_long_report_length into
> > >     hidpp_validate_device() since it already fetches very long report
> > >     length and validates its value
> > >
> > > Fixes: fe3ee1ec007b ("HID: logitech-hidpp: allow non HID++ devices to=
 be handled by this module")
> > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D204191
> > > Reported-by: Sam Bazely <sambazley@fastmail.com>
> > > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > > Cc: Jiri Kosina <jikos@kernel.org>
> > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > > Cc: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> > > Cc: Austin Palmer <austinp@valvesoftware.com>
> > > Cc: linux-input@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: stable@vger.kernel.org # 5.2+
> > > ---
> > >  drivers/hid/hid-logitech-hidpp.c | 54 ++++++++++++++++++------------=
--
> > >  1 file changed, 30 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logit=
ech-hidpp.c
> > > index 85911586b3b6..8c4be991f387 100644
> > > --- a/drivers/hid/hid-logitech-hidpp.c
> > > +++ b/drivers/hid/hid-logitech-hidpp.c
> > > @@ -3498,34 +3498,45 @@ static int hidpp_get_report_length(struct hid=
_device *hdev, int id)
> > >         return report->field[0]->report_count + 1;
> > >  }
> > >
> > > -static bool hidpp_validate_report(struct hid_device *hdev, int id,
> > > -                                 int expected_length, bool optional)
> > > +static bool hidpp_validate_device(struct hid_device *hdev)
> > >  {
> > > -       int report_length;
> > > +       struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> > > +       int id, report_length, supported_reports =3D 0;
> > > +
> > > +       id =3D REPORT_ID_HIDPP_SHORT;
> > > +       report_length =3D hidpp_get_report_length(hdev, id);
> > > +       if (report_length) {
> > > +               if (report_length < HIDPP_REPORT_SHORT_LENGTH)
> > > +                       goto bad_device;
> > >
> > > -       if (id >=3D HID_MAX_IDS || id < 0) {
> > > -               hid_err(hdev, "invalid HID report id %u\n", id);
> > > -               return false;
> > > +               supported_reports++;
> > >         }
> > >
> > > +       id =3D REPORT_ID_HIDPP_LONG;
> > >         report_length =3D hidpp_get_report_length(hdev, id);
> > > -       if (!report_length)
> > > -               return optional;
> > > +       if (report_length) {
> > > +               if (report_length < HIDPP_REPORT_LONG_LENGTH)
> > > +                       goto bad_device;
> > >
> > > -       if (report_length < expected_length) {
> > > -               hid_warn(hdev, "not enough values in hidpp report %d\=
n", id);
> > > -               return false;
> > > +               supported_reports++;
> > >         }
> > >
> > > -       return true;
> > > -}
> > > +       id =3D REPORT_ID_HIDPP_VERY_LONG;
> > > +       report_length =3D hidpp_get_report_length(hdev, id);
> > > +       if (report_length) {
> > > +               if (report_length > HIDPP_REPORT_LONG_LENGTH &&
> > > +                   report_length < HIDPP_REPORT_VERY_LONG_MAX_LENGTH=
)
> >
> > Can you double check the conditions here?
> > It's late, but I think you inverted the tests as we expect the report
> > length to be between HIDPP_REPORT_LONG_LENGTH and
> > HIDPP_REPORT_VERY_LONG_MAX_LENGTH inclusive, while here this creates a
> > bad_device.
>
> Hmm, I think you are right. Not sure why I didn't catch it on G920
> since it support very long reports AFAIR. Will re-spin and double
> check in v3. Sorry about that.
>

Oh, the issue is that the very long HID++ reports on the G920 are
HIDPP_REPORT_VERY_LONG_MAX_LENGTH long, which means the test will fail
for those.

Cheers,
Benjamin

