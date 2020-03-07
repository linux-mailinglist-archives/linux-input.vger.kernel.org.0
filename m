Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA82617D07A
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 23:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCGWjw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 17:39:52 -0500
Received: from saul.pp3345.net ([163.172.111.124]:52078 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgCGWjw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 17:39:52 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: dev@pp3345.net)
        by saul.pp3345.net (Postcow) with ESMTPSA id CF43F9A4411;
        Sat,  7 Mar 2020 23:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
        t=1583620791; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:openpgp:autocrypt;
        bh=mFMFTtNNRFGMFKc9Dj+5ZTdNUIaj/o3jwaMi9W8rPrw=;
        b=IQVbx8pEVsfWNpFhZuULP6wkqLkiQ+IOwqUNiFrxXrGAHDIghvuK39fvsfpIr57b+Jl6eU
        9VFgqxhTfnpX0fxyLEvYVIzzCyFCJm0FCMPmmn5DZDwjC+ckHtPOtkQBz3FArgydn/UO2l
        40J0VzrcfKNaJcqbKBPyCwbl/MYLBHPIvXLDnrkBf+IW3sVT+fmVnvZWQrlA/n+f0iurZ5
        W+gyjMA67fFxc5HVEcxIcJLH4QemFlrmvuoRzEBz3cb2PCjN/Ruohu2+dx6nrfMc7xhCvf
        J1qFU9oaXyl5Nx/D6s0sHbrD1OYx0Olzi8edYHtC8Seu5U0XUnr8NCVqtGAtGg==
Subject: Re: [PATCH] Input: synaptics - Enable RMI on HP Envy 13-ad105ng
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200307213508.267187-1-dev@pp3345.net>
 <20200307221843.GR217608@dtor-ws>
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <ca0d34cd-505d-5107-3528-ca6a9c7d13bf@pp3345.net>
Date:   Sat, 7 Mar 2020 23:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307221843.GR217608@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net;
        s=saul; t=1583620791; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:openpgp:autocrypt;
        bh=mFMFTtNNRFGMFKc9Dj+5ZTdNUIaj/o3jwaMi9W8rPrw=;
        b=eGmsYshvtyeCjo35BbH2j6IV9HvtyBAk2yNUrp/A6K5Jo6mMFJlttDalQT91GySMI+KQQn
        uB1KSifqwWTTqe0116A2XJ6kr4ZVvnp2oOFaD2HRWWt6I6nnl8J739n6nmkCAtHXHQryyi
        cvKX0BiUJE2FuopTH/7GDhopPzIAmmSg1xDhIZbHIUaf1Aeqg7B2KpOrbrAISZ+B/JFqR4
        feCrAaNX+YWCIRIC7UyEIfzNMEKPl7iWH3gVvlz334Lvmxi3vFPgvY7SqNANdAjuG5Ex4F
        3ZzwcOSgeHEEk0bLW6oymLEWQDa5ymfiaF9Seuuay9BQLQlNgLDzfoWLqorhpg==
ARC-Seal: i=1; s=saul; d=pp3345.net; t=1583620791; a=rsa-sha256; cv=none;
        b=aK8dTX53CSvYztdlh6QUPsdVkPzAYHSPhnMH0cTZyWRksyeaI9xcG/pHg+6rUwZXOZF786
        cMZQTBR+hdU5icx5cjQWbPqMywoVSAllBwvs6j898k2a0P0TvtBiXlJkgd9kq6GDoG0foI
        vLaXP61u+ByyP7mRwSnxoiRoogl6EM94ongtp6gS3k/DGjr7zt6vMWKFt/tMWYjE1oDW+P
        h0PKVkwFCpoJ2CmB1cQZdKl0rt6bj2SmXSlagCcEjw+/CLhaz/v6JIyWneTFgxncqh8I6z
        eNuL1AVI0SembpeWcaISvKi5s7SmRdAFL5FbDjfL6heVW3qpsoqjumUKYbTD9A==
ARC-Authentication-Results: i=1;
        saul.pp3345.net;
        auth=pass smtp.auth=dev@pp3345.net smtp.mailfrom=dev@pp3345.net
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I currently don't have access to the device anymore, but apart from 
missing gesture functionality, it seemed to have some issues with 
selecting text by clicking and moving the cursor when running in PS/2 
mode, so I guess it might be good to push the patch to stable.

Regards
Yussuf Khalil

> Hi Yussuf,
> 
> On Sat, Mar 07, 2020 at 10:35:08PM +0100, Yussuf Khalil wrote:
>> This laptop (and perhaps other variants of the same model) reports an
>> SMBus-capable Synaptics touchpad. Everything (including suspend and
>> resume) works fine when RMI is enabled via the kernel command line, so
>> let's add it to the whitelist.
> 
> Are there issues with the touchpad when it works in the legacy (PS/2)
> mode? I will be applying your patch, I just need to understand if it
> needs to go into stable series, or we can just get it into 5.6 and later
> versions.
> 
> Thanks!
> 
