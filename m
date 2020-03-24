Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1A9C19125E
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 15:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgCXOD2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 10:03:28 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:38815 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgCXOD2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 10:03:28 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2DA9BC0017;
        Tue, 24 Mar 2020 14:03:24 +0000 (UTC)
Message-ID: <220e8421f8ee0cf80375bfc4635e3eaa2bb8daf1.camel@hadess.net>
Subject: Re: [PATCH v2] HID: logitech-dj: issue udev change event on device
 connection
From:   Bastien Nocera <hadess@hadess.net>
To:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <superm1@gmail.com>,
        Richard Hughes <hughsient@gmail.com>
Date:   Tue, 24 Mar 2020 15:03:24 +0100
In-Reply-To: <b9a26e3bb00212afd960f98dba8f7bb58cdd49e5.camel@archlinux.org>
References: <20200318161906.3340959-1-lains@archlinux.org>
         <20200318192721.390630-1-lains@archlinux.org>
         <92f48f409e913299c12322d195c88792bb4e5c9c.camel@hadess.net>
         <b9a26e3bb00212afd960f98dba8f7bb58cdd49e5.camel@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 (3.36.0-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-03-24 at 13:46 +0000, Filipe Laíns wrote:
> On Tue, 2020-03-24 at 11:20 +0100, Bastien Nocera wrote:
> > On Wed, 2020-03-18 at 19:27 +0000, Filipe Laíns wrote:
> > > As discussed in the mailing list:
> > > 
> > > > Right now the hid-logitech-dj driver will export one node for
> > > > each
> > > > connected device, even when the device is not connected. That
> > > > causes
> > > > some trouble because in userspace we don't have have any way to
> > > > know if
> > > > the device is connected or not, so when we try to communicate,
> > > > if
> > > > the
> > > > device is disconnected it will fail.
> > 
> > Why is it a problem that user-space communication fails? Note that
> > sending a signal without any way to fetch the state means that it's
> > always going to be racy.
> 
> It failing is not the problem. The problem is knowing when the device
> is available again. Right now the only way to do that is to listen
> for
> events or periodically ping it.
> 
> We want to only export the HID++ hidraw node when the device is
> available but that will take a while. We will have to test and sync
> up
> userspace. I also want to write tests for the driver before, to make
> sure there are no regressions. We had a thread discussing this, IIRC
> you were in CC.

If I need to remember some old thread to know what we're talking about,
then that means that the commit message is probably not good enough...

Please add some links to the relevant discussion on bug forums if
there's interesting data there too.


> 
> > > The solution reached to solve this issue is to trigger an udev
> > > change
> > > event when the device connects, this way userspace can just wait
> > > on
> > > those connections instead of trying to ping the device.
> > > 
> > > Signed-off-by: Filipe Laíns <lains@archlinux.org>
> > > 
> > > ---
> > > 
> > > v2:
> > >   - Issue udev change event on the connected hid device, not on
> > > the
> > >   receiver
> > > 
> > > ---
> > >  drivers/hid/hid-logitech-dj.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> > > logitech-dj.c
> > > index 48dff5d6b605..282e57dd467d 100644
> > > --- a/drivers/hid/hid-logitech-dj.c
> > > +++ b/drivers/hid/hid-logitech-dj.c
> > > @@ -1412,6 +1412,7 @@ static int logi_dj_dj_event(struct
> > > hid_device
> > > *hdev,
> > >  {
> > >  	struct dj_receiver_dev *djrcv_dev = hid_get_drvdata(hdev);
> > >  	struct dj_report *dj_report = (struct dj_report *) data;
> > > +	struct dj_device *dj_dev;
> > >  	unsigned long flags;
> > >  
> > >  	/*
> > > @@ -1447,7 +1448,9 @@ static int logi_dj_dj_event(struct
> > > hid_device
> > > *hdev,
> > >  
> > >  	spin_lock_irqsave(&djrcv_dev->lock, flags);
> > >  
> > > -	if (!djrcv_dev->paired_dj_devices[dj_report->device_index]) {
> > > +	dj_dev = djrcv_dev->paired_dj_devices[dj_report->device_index];
> > > +
> > > +	if (!dj_dev) {
> > >  		/* received an event for an unknown device, bail out */
> > >  		logi_dj_recv_queue_notification(djrcv_dev, dj_report);
> > >  		goto out;
> > > @@ -1464,6 +1467,8 @@ static int logi_dj_dj_event(struct
> > > hid_device
> > > *hdev,
> > >  		if (dj_report-
> > > > report_params[CONNECTION_STATUS_PARAM_STATUS] ==
> > >  		    STATUS_LINKLOSS) {
> > >  			logi_dj_recv_forward_null_report(djrcv_dev,
> > > dj_report);
> > > +		} else {
> > > +			kobject_uevent(&dj_dev->hdev->dev.kobj,
> > > KOBJ_CHANGE);
> > >  		}
> > >  		break;
> > >  	default:

