Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E551ED24C
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 16:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgFCOpU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 10:45:20 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60948 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgFCOpU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 10:45:20 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053Eg7YM033013;
        Wed, 3 Jun 2020 14:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=CD8BPhNFQrGZglesYkAqKUL+AjoZd9qnDdoPTaQkXGg=;
 b=PDtwXBsk3rWyVxk+WWxPZWGTx0B83SqsP4ONTTbyd1bRt6AllT/uzoi5renJrMdhy+Q1
 BDZf+itg1qBg84wtDy06UZSm0h7Q71z1pVyhdmes4ulfyD3PisfI18N212RQIhU39/qM
 /lpggRNqt92eOdI16/ggRThfuO6jEQHdlsxeSUZJqHGZVvR2oz5l2R7kUrHp4yZF6dO8
 byW/FhOMV3lSzemr4+qgk/X9D+8QYdk+2QXtvrGeeCcTXgPjpsPTCGG0iA0p4BYropCl
 UQm4GxakBo5qG1dWOendmAGJNIsYnCNPROTv97el/gx35N+3EhZPr87wYXtbRHW2l1qj OQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31dkrupre4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 03 Jun 2020 14:45:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053Ei1Wi061055;
        Wed, 3 Jun 2020 14:45:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 31c25saefa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Jun 2020 14:45:15 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 053EjDPa003831;
        Wed, 3 Jun 2020 14:45:13 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Jun 2020 07:45:13 -0700
Date:   Wed, 3 Jun 2020 17:45:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: ims-pcu: remove redundant assignment to variable
 'error'
Message-ID: <20200603144507.GM30374@kadam>
References: <20200603135102.130436-1-colin.king@canonical.com>
 <20200603140953.GL30374@kadam>
 <c4290ddf-8faa-bb09-bd96-4c01a3f1cc2b@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4290ddf-8faa-bb09-bd96-4c01a3f1cc2b@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=2 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=2 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030117
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 03, 2020 at 03:18:46PM +0100, Colin Ian King wrote:
> On 03/06/2020 15:09, Dan Carpenter wrote:
> > On Wed, Jun 03, 2020 at 02:51:02PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The variable error is being initialized with a value that is
> >> never read and the -ENOMEM error return is being returned anyhow
> >> by the error exit path to label err_free_mem.  The assignment is
> >> redundant and can be removed.
> >>
> >> Addresses-Coverity: ("Unused value")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>  drivers/input/misc/ims-pcu.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
> >> index d8dbfc030d0f..4ba68aa3d281 100644
> >> --- a/drivers/input/misc/ims-pcu.c
> >> +++ b/drivers/input/misc/ims-pcu.c
> >> @@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
> >>  	if (!gamepad || !input) {
> >>  		dev_err(pcu->dev,
> >>  			"Not enough memory for gamepad device\n");
> >> -		error = -ENOMEM;
> >>  		goto err_free_mem;
> > 
> > It would be better to change the return instead.
> > 
> > regards,
> > dan carpenter
> > 
> 
> I'm not sure about that, the err_free_mem path is used by another error
> exit return path that also needs to free the device and gamepad and
> returns ENOMEM, so I think this is a good enough shared error exit strategy.

The code looks like this:

drivers/input/misc/ims-pcu.c
   284  static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
   285  {
   286          struct ims_pcu_gamepad *gamepad;
   287          struct input_dev *input;
   288          int error;
   289  
   290          gamepad = kzalloc(sizeof(struct ims_pcu_gamepad), GFP_KERNEL);
   291          input = input_allocate_device();
   292          if (!gamepad || !input) {
   293                  dev_err(pcu->dev,
   294                          "Not enough memory for gamepad device\n");
   295                  error = -ENOMEM;
   296                  goto err_free_mem;

The "error" is always set before all the gotos.

   297          }
   298  
   299          gamepad->input = input;
   300  
   301          snprintf(gamepad->name, sizeof(gamepad->name),
   302                   "IMS PCU#%d Gamepad Interface", pcu->device_no);
   303  
   304          usb_make_path(pcu->udev, gamepad->phys, sizeof(gamepad->phys));
   305          strlcat(gamepad->phys, "/input1", sizeof(gamepad->phys));
   306  
   307          input->name = gamepad->name;
   308          input->phys = gamepad->phys;
   309          usb_to_input_id(pcu->udev, &input->id);
   310          input->dev.parent = &pcu->ctrl_intf->dev;
   311  
   312          __set_bit(EV_KEY, input->evbit);
   313          __set_bit(BTN_A, input->keybit);
   314          __set_bit(BTN_B, input->keybit);
   315          __set_bit(BTN_X, input->keybit);
   316          __set_bit(BTN_Y, input->keybit);
   317          __set_bit(BTN_START, input->keybit);
   318          __set_bit(BTN_SELECT, input->keybit);
   319  
   320          __set_bit(EV_ABS, input->evbit);
   321          input_set_abs_params(input, ABS_X, -1, 1, 0, 0);
   322          input_set_abs_params(input, ABS_Y, -1, 1, 0, 0);
   323  
   324          error = input_register_device(input);
   325          if (error) {
   326                  dev_err(pcu->dev,
   327                          "Failed to register gamepad input device: %d\n",
   328                          error);
   329                  goto err_free_mem;

The input_register_device() can return a bunch of different error codes.
Better to preserve them.  "error" is set.

   330          }
   331  
   332          pcu->gamepad = gamepad;
   333          return 0;
   334  
   335  err_free_mem:
   336          input_free_device(input);
   337          kfree(gamepad);
   338          return -ENOMEM;

We just change this from "return -ENOMEM;" to "return error;"

   339  }

regards,
dan carpenter

