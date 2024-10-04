Return-Path: <linux-input+bounces-7063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D398FF64
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B251C21C3E
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 09:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AEF81AB4;
	Fri,  4 Oct 2024 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdpYMfu1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BFB17758;
	Fri,  4 Oct 2024 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033164; cv=none; b=WYYB6BlhwiSyqPcu+mNJPAuvFiivLY0HQhJmorDZAoXMbCGG0K+ZOFZbXpZwb9+OPMxcdGgDdNOpbJ7emDKO95x5qXWL9l+iA918qt2MVg/ocGQZmYL+oRz6E69Uge7kTFKWKTtvxqOwjU0NhTTn13yzBCKijxHCwWzLckNB6sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033164; c=relaxed/simple;
	bh=PngHURkFuXiBephwfpYTKTw7blLUCwxL7c/mijJdMMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLsDU4vZR4UEo5DlNYmC6+JaiYS74IMhY1ou7NNw5R3dNwPx+/5Ce7HAwKU3XW0QQAsp3H6f4G9gtL2/RhV7DtQNh4mJsANQq3iZxG1DRkqNj9lODFGKz8oLZRk8ukkiHyLVZFDm7OmoXDRXNposTLcU/BJQ1HNOyawCQtdihOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdpYMfu1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4D2C4CEC6;
	Fri,  4 Oct 2024 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728033163;
	bh=PngHURkFuXiBephwfpYTKTw7blLUCwxL7c/mijJdMMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdpYMfu1ZNb3AjRTdiZ2QJw0Xnbjicx9Gz6ELRP4E4JrLmE/nPbNKByFDXOWJlnrb
	 KWvMKAh5xOwioQ6NWUdwP3kUxhQ1uPijOWoKK9kXHBv4R5Tcjxkj4C/AkXs/9/54I+
	 zyldPeYw7YSA1lamnAz7eClzf/uRYOdoAwDInzu1EE2xJksHXklsahEMPjbHxuG+JI
	 AkdbYlX5TMIPXCjRbFvInTMvcnW7pwzn+zVbxh9f1+AcJDJqffnxpJrjMBobei2Y5l
	 1GztfHwwT6E5fyFRQt0dg9YW8Q0mxcN5wkHvtd3gjNvxhCUgC5Bgkxi0iH+uwGUIFw
	 aL6wET2oppxBw==
Date: Fri, 4 Oct 2024 11:12:38 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org, 
	linux-input@vger.kernel.org, Chris Hixon <linux-kernel-bugs@hixontech.com>, 
	Skyler <skpu@pm.me>, Richard <hobbes1069@gmail.com>
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
Message-ID: <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
 <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>

On Oct 04 2024, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing the three reporters and the regressions list]
> 
> On 03.10.24 18:04, Basavaraj Natikar wrote:
> > There is no need for additional cleanup, as all resources are managed.
> > Additionally, if no sensor is found, there will be no initialization of
> > HID devices. Therefore, return immediately if no sensor is detected.
> 
> I'm not a reviewer, so feel free to ignore the follow comment:
> 
> I think the patch description should mentioned that this bug caused
> Memory Errors / Page Faults / btrfs going read-only / btrfs disk
> corruption, as that is a crucial detail for later and downstreams that
> need to consider when deciding about backporting.
> 
> > Fixes: 8031b001da70 ("HID: amd_sfh: Move sensor discovery before HID device initialization")
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=219331
> 
> Some reported-by tags IMHO would be appropriate to give credit; all
> three reporters already agreed to use their email address in public.
> 
> There meanwhile is also one comment in the bugzilla ticket that could be
> read as a tested-by tag.
> 
> Maybe a Link: to
> https://lore.kernel.org/all/90f6ee64-df5e-43b2-ad04-fa3a35efc1d5@leemhuis.info/
> might be appropriate as well.
> 
> Ohh, and participation in stable is optional, but given the severeness
> on the problem: would you maybe be willing to add a stable tag to the
> commit to ensure this is backported to affected stable series quickly?

Fully agree here. It would definitely help if the submitter of the patch
keeps track of all of these instead of relying on the maintainers or
Thorsten to do the tedious work.

I was about to apply the patch, but I still have one remark on the fix
itself.


> 
> Ciao, Thorsten
> 
> > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > ---
> >  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 3 +--
> >  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 4 +++-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> > index 4b59687ff5d8..3fcb971d5fda 100644
> > --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> > +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> > @@ -297,8 +297,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
> >  	    (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
> >  		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
> >  			 cl_data->is_any_sensor_enabled);
> > -		rc = -EOPNOTSUPP;
> > -		goto cleanup;
> > +		return -EOPNOTSUPP;

so cleanup is doing:
cleanup:
	amd_sfh_hid_client_deinit(privdata);
	for (i = 0; i < cl_data->num_hid_devices; i++) {
		devm_kfree(dev, cl_data->feature_report[i]);
		devm_kfree(dev, in_data->input_report[i]);
		devm_kfree(dev, cl_data->report_descr[i]);
	}
	return rc;

Would that means that the memory corruption appears during
amd_sfh_hid_client_deinit(), or...

> >  	}
> >  
> >  	for (i = 0; i < cl_data->num_hid_devices; i++) {
> > diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > index 0c28ca349bcd..1300f122b524 100644
> > --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > @@ -351,7 +351,9 @@ static void sfh_init_work(struct work_struct *work)
> >  
> >  	rc = amd_sfh_hid_client_init(mp2);
> >  	if (rc) {
> > -		amd_sfh_clear_intr(mp2);
> > +		if (rc != -EOPNOTSUPP)
> > +			amd_sfh_clear_intr(mp2);

... or during amd_sfh_clear_intr()?

This very much looks like a band-aid (I know it is because you can not
reproduce, not blaming anyone), but I'd like to know a little bit more
if the bug is not appearing anywhere else in the normal processing of
the driver itself.

Also a comment explaining why this is the only case where
amd_sfh_clear_intr() should not be called would be appreciated.

So all in all, I have a feeling one of these 2 functions is not making a
proper check and I would rather fix the root cause, not the symptoms.

Cheers,
Benjamin


PS: sorry, I know this is a long standing issue, but I'd rather not
paper over a bigger issue :/

> > +
> >  		dev_err(&pdev->dev, "amd_sfh_hid_client_init failed err %d\n", rc);
> >  		return;
> >  	}
> 

