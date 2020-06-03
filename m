Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A411ED309
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 17:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgFCPKs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 11:10:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55274 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgFCPKr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 11:10:47 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jgV2S-0002Mm-R3; Wed, 03 Jun 2020 15:10:44 +0000
Subject: Re: [PATCH] input: ims-pcu: remove redundant assignment to variable
 'error'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200603135102.130436-1-colin.king@canonical.com>
 <20200603140953.GL30374@kadam>
 <c4290ddf-8faa-bb09-bd96-4c01a3f1cc2b@canonical.com>
 <20200603144507.GM30374@kadam>
From:   Colin Ian King <colin.king@canonical.com>
Autocrypt: addr=colin.king@canonical.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ee8443d6-3ac1-83ba-a921-e9fdbc7a02c3@canonical.com>
Date:   Wed, 3 Jun 2020 16:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603144507.GM30374@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03/06/2020 15:45, Dan Carpenter wrote:
> On Wed, Jun 03, 2020 at 03:18:46PM +0100, Colin Ian King wrote:
>> On 03/06/2020 15:09, Dan Carpenter wrote:
>>> On Wed, Jun 03, 2020 at 02:51:02PM +0100, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The variable error is being initialized with a value that is
>>>> never read and the -ENOMEM error return is being returned anyhow
>>>> by the error exit path to label err_free_mem.  The assignment is
>>>> redundant and can be removed.
>>>>
>>>> Addresses-Coverity: ("Unused value")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>  drivers/input/misc/ims-pcu.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
>>>> index d8dbfc030d0f..4ba68aa3d281 100644
>>>> --- a/drivers/input/misc/ims-pcu.c
>>>> +++ b/drivers/input/misc/ims-pcu.c
>>>> @@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
>>>>  	if (!gamepad || !input) {
>>>>  		dev_err(pcu->dev,
>>>>  			"Not enough memory for gamepad device\n");
>>>> -		error = -ENOMEM;
>>>>  		goto err_free_mem;
>>>
>>> It would be better to change the return instead.
>>>
>>> regards,
>>> dan carpenter
>>>
>>
>> I'm not sure about that, the err_free_mem path is used by another error
>> exit return path that also needs to free the device and gamepad and
>> returns ENOMEM, so I think this is a good enough shared error exit strategy.
> 
> The code looks like this:
> 
> drivers/input/misc/ims-pcu.c
>    284  static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
>    285  {
>    286          struct ims_pcu_gamepad *gamepad;
>    287          struct input_dev *input;
>    288          int error;
>    289  
>    290          gamepad = kzalloc(sizeof(struct ims_pcu_gamepad), GFP_KERNEL);
>    291          input = input_allocate_device();
>    292          if (!gamepad || !input) {
>    293                  dev_err(pcu->dev,
>    294                          "Not enough memory for gamepad device\n");
>    295                  error = -ENOMEM;
>    296                  goto err_free_mem;
> 
> The "error" is always set before all the gotos.
> 
>    297          }
>    298  
>    299          gamepad->input = input;
>    300  
>    301          snprintf(gamepad->name, sizeof(gamepad->name),
>    302                   "IMS PCU#%d Gamepad Interface", pcu->device_no);
>    303  
>    304          usb_make_path(pcu->udev, gamepad->phys, sizeof(gamepad->phys));
>    305          strlcat(gamepad->phys, "/input1", sizeof(gamepad->phys));
>    306  
>    307          input->name = gamepad->name;
>    308          input->phys = gamepad->phys;
>    309          usb_to_input_id(pcu->udev, &input->id);
>    310          input->dev.parent = &pcu->ctrl_intf->dev;
>    311  
>    312          __set_bit(EV_KEY, input->evbit);
>    313          __set_bit(BTN_A, input->keybit);
>    314          __set_bit(BTN_B, input->keybit);
>    315          __set_bit(BTN_X, input->keybit);
>    316          __set_bit(BTN_Y, input->keybit);
>    317          __set_bit(BTN_START, input->keybit);
>    318          __set_bit(BTN_SELECT, input->keybit);
>    319  
>    320          __set_bit(EV_ABS, input->evbit);
>    321          input_set_abs_params(input, ABS_X, -1, 1, 0, 0);
>    322          input_set_abs_params(input, ABS_Y, -1, 1, 0, 0);
>    323  
>    324          error = input_register_device(input);
>    325          if (error) {
>    326                  dev_err(pcu->dev,
>    327                          "Failed to register gamepad input device: %d\n",
>    328                          error);
>    329                  goto err_free_mem;
> 
> The input_register_device() can return a bunch of different error codes.
> Better to preserve them.  "error" is set.
> 
>    330          }
>    331  
>    332          pcu->gamepad = gamepad;
>    333          return 0;
>    334  
>    335  err_free_mem:
>    336          input_free_device(input);
>    337          kfree(gamepad);
>    338          return -ENOMEM;
> 
> We just change this from "return -ENOMEM;" to "return error;"
> 
>    339  }
> 
> regards,
> dan carpenter
> 
Elegantly explained, thanks Dan, I'll send a V2.

Colin
