Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9FF42E6E8
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 04:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbhJODA2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 23:00:28 -0400
Received: from mx24.baidu.com ([111.206.215.185]:41964 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233900AbhJODA1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 23:00:27 -0400
Received: from BC-Mail-Ex14.internal.baidu.com (unknown [172.31.51.54])
        by Forcepoint Email with ESMTPS id 292F8561FA9345774D2A;
        Fri, 15 Oct 2021 10:58:16 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex14.internal.baidu.com (172.31.51.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 15 Oct 2021 10:58:16 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 15
 Oct 2021 10:58:15 +0800
Date:   Fri, 15 Oct 2021 10:58:15 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     Jason Gerecke <killertofu@gmail.com>
CC:     "Cheng, Ping" <Ping.Cheng@wacom.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Gerecke, Jason" <Jason.Gerecke@wacom.com>,
        Aaron Skomra <skomra@gmail.com>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>
Subject: Re: [PATCH] HID: wacom: Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210922125939.427-1-caihuoqing@baidu.com>
 <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm>
 <CANRwn3SZagP7uCSHVDGMPMqQiKyUQJSjq143_DA1y0UPvsmkAA@mail.gmail.com>
 <DB6PR07MB4278FF50AB23B9B69411CA3B9BB19@DB6PR07MB4278.eurprd07.prod.outlook.com>
 <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex31.internal.baidu.com (172.31.51.25) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 14 10月 21 10:31:03, Jason Gerecke wrote:
> I've attached an RFC patch which shrinks the critical section as I
> previously described. This would be applied prior to Cai's patch.
Hi Jason,


I haved sorted the patches to a series, and fixed the repeated "that"
in changelog.

like this:
https://patchwork.kernel.org/project/linux-input/patch/20211015022803.3827-1-caihuoqing@baidu.com/

If there are any issue to resend v3 or later, feel free to sort my patch
as series. You also can attach your patch link directly here.

BTW, a minor issue, for 'RFC' prefix, you can use
git format-patch --rfc. It should be showed in subject prefix, like
"[RFC PATCH ..]" (in the link, I missed fixing it).

> 
> I would appreciate a few more sets of eyes reviewing / testing the change.
> 
> Jason
> ---
> Now instead of four in the eights place /
> you’ve got three, ‘Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can’t take seven from three,    /
> So you look at the sixty-fours....
> 
> 
> 
> On Thu, Oct 7, 2021 at 3:34 PM Cheng, Ping <Ping.Cheng@wacom.com> wrote:
> 
> > I didn’t add mutex_unlock nor work on wacom_remove_shared_data myself.
> > Benjamin probably sync’d unlock and Dmitry added shared_data for Wacom
> > driver many years ago. Thank you both!
> >
> >
> >
> > With that said, I am willing to look into the code and test the patch to
> > make sure it doesn’t break anything, which may take a few more days…
> >
> >
> >
> > *From:* Jason Gerecke [mailto:killertofu@gmail.com]
> > *Sent:* Thursday, October 7, 2021 2:48 PM
> >
> >
> >
> > I have not tested this, but it seems like the failure case could trigger a
> > deadlock:
> >
> >
> >
> > 1. (wacom_sys.c:878): The `wacom_udev_list_lock` mutex is locked
> >
> > 2. (wacom_sys.c:888): The `data->kref` refcount is initialized to 1
> >
> > 3. (wacom_sys.c:893): The `wacom_wac->shared` pointer is set
> >
> > 4. (wacom_sys.c:895): We call `devm_add_action_or_reset`
> >
> > 5. Adding the action fails, causing the `devm_add_action_or_reset` to
> > immediately call `wacom_remove_shared_data`
> >
> > 6. (wacom_sys.c:866): The reference count of `data->kref` is decremented,
> > triggering a call to `wacom_release_shared_data`
> >
> > 7. (wacom_sys.c:844): The `wacom_release_shared_data` function blocks on
> > the previously-locked `wacom_udev_list_lock` mutex
> >
> >
> >
> > I *think* it would be safe to shrink the critical section in
> > `wacom_add_shared_data` to end before the call to
> > `devm_add_action_or_reset`. It might be possible to push the unlock as far
> > back as line 892. That should be sufficient to protect `wacom_udev_list`
> > and ensure that we don't accidentally create two "shared" objects when only
> > one is desired. I'll defer to Ping since it looks like she added the mutex
> > though :)
> >
> >
> > Jason
> >
> > On Thu, Oct 7, 2021 at 4:39 AM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Wed, 22 Sep 2021, Cai Huoqing wrote:
> >
> > > The helper function devm_add_action_or_reset() will internally
> > > call devm_add_action(), and if devm_add_action() fails then it will
> > > execute the action mentioned and return the error code. So
> > > use devm_add_action_or_reset() instead of devm_add_action()
> > > to simplify the error handling, reduce the code.
> > >
> > > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> >
> > CCing Jason and Ping to Ack this for the Wacom driver.
> >
> > > ---
> > >  drivers/hid/wacom_sys.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > > index 93f49b766376..3aed7ba249f7 100644
> > > --- a/drivers/hid/wacom_sys.c
> > > +++ b/drivers/hid/wacom_sys.c
> > > @@ -892,10 +892,9 @@ static int wacom_add_shared_data(struct hid_device
> > *hdev)
> > >
> > >       wacom_wac->shared = &data->shared;
> > >
> > > -     retval = devm_add_action(&hdev->dev, wacom_remove_shared_data,
> > wacom);
> > > +     retval = devm_add_action_or_reset(&hdev->dev,
> > wacom_remove_shared_data, wacom);
> > >       if (retval) {
> > >               mutex_unlock(&wacom_udev_list_lock);
> > > -             wacom_remove_shared_data(wacom);
> > >               return retval;
> > >       }
> > >
> > > --
> > > 2.25.1
> >
> >

> From 7adc05783c7e3120028d0d089bea224903c24ccd Mon Sep 17 00:00:00 2001
> From: Jason Gerecke <jason.gerecke@wacom.com>
> Date: Thu, 14 Oct 2021 07:31:31 -0700
> Subject: [PATCH] RFC: HID: wacom: Shrink critical section in
>  `wacom_add_shared_data`
> 
> The size of the critical section in this function appears to be larger
> than necessary. The `wacom_udev_list_lock` exists to ensure that one
> interface cannot begin checking if a shared object exists while a second
> interface is doing the same (otherwise both could determine that that no
> object exists yet and create their own independent objects rather than
> sharing just one). It should be safe for the critical section to end
> once a fresly-allocated shared object would be found by other threads
> (i.e., once it has been added to `wacom_udev_list`, which is looped
> over by `wacom_get_hdev_data`).
> 
> This commit is a necessary pre-requisite for a later change to swap the
> use of `devm_add_action` with `devm_add_action_or_reset`, which would
> otherwise deadlock in its error case.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> ---
>  drivers/hid/wacom_sys.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 93f49b766376..62f50e4b837d 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -881,8 +881,8 @@ static int wacom_add_shared_data(struct hid_device *hdev)
>  	if (!data) {
>  		data = kzalloc(sizeof(struct wacom_hdev_data), GFP_KERNEL);
>  		if (!data) {
> -			retval = -ENOMEM;
> -			goto out;
> +			mutex_unlock(&wacom_udev_list_lock);
> +			return -ENOMEM;
>  		}
>  
>  		kref_init(&data->kref);
> @@ -890,11 +890,12 @@ static int wacom_add_shared_data(struct hid_device *hdev)
>  		list_add_tail(&data->list, &wacom_udev_list);
>  	}
>  
> +	mutex_unlock(&wacom_udev_list_lock);
> +
>  	wacom_wac->shared = &data->shared;
>  
>  	retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
>  	if (retval) {
> -		mutex_unlock(&wacom_udev_list_lock);
>  		wacom_remove_shared_data(wacom);
>  		return retval;
>  	}
> @@ -904,8 +905,6 @@ static int wacom_add_shared_data(struct hid_device *hdev)
>  	else if (wacom_wac->features.device_type & WACOM_DEVICETYPE_PEN)
>  		wacom_wac->shared->pen = hdev;
>  
> -out:
> -	mutex_unlock(&wacom_udev_list_lock);
>  	return retval;
>  }
>  
> -- 
> 2.33.0
> 

